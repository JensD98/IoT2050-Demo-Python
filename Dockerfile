FROM python:3 as build

WORKDIR /app

RUN apt update && \
    apt install libgl1-mesa-glx -y && \
    pip install numpy flask gunicorn opencv-contrib-python imutils

COPY main ./

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]