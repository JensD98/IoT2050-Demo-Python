FROM python:3

WORKDIR /app

COPY main requirements ./

RUN apt-get update && \
    apt-get install libgl1-mesa-glx -y && \
    pip install -r prod.txt 

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]