TAG = "iot2050-demo-python"
NAME = "webcam-app"

build:
	docker build -t $(TAG) .
start-app:
	docker run -p 5000:5000 -d --rm --device /dev/video0 --name $(NAME) $(TAG)
stop-app:
	docker stop $(NAME)
