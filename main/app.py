from flask import Flask, render_template, Response
from flask.helpers import stream_with_context
from imutils.video import VideoStream
import cv2 as cv
import threading

app = Flask(__name__)

outputFrame = None
lock = threading.Lock()
videoStream = VideoStream(src=0).start()


@app.route("/")
def home():
    return render_template("home.html")


@app.route("/video")
def video():
    return render_template("video.html")


@app.route("/video_feed")
def video_feed():
    return Response(stream_with_context(generate()), mimetype="multipart/x-mixed-replace; boundary=frame")


def read_next_frame():
    global outputFrame, lock, videoStream
    while True:
        frame = videoStream.read()
        with lock:
            outputFrame = frame.copy()


def generate():
    global outputFrame, lock
    while True:
        with lock:
            if outputFrame is None:
                continue

            (success, encodedImage) = cv.imencode(".jpg", outputFrame)

            if not success:
                continue

        yield(b"--frame\r\nContent-Type: image/jpeg\r\n\r\n" +
              bytearray(encodedImage) + b"\r\n")


thread = threading.Thread(target=read_next_frame, daemon=True)
thread.start()
