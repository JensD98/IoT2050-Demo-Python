FROM python:3

WORKDIR /app

COPY main requirements ./

RUN apt-get update && \
    apt-get install libgl1-mesa-glx -y && \
    pip install -r prod.txt 

CMD ["flask", "run", "--host=0.0.0.0"]
