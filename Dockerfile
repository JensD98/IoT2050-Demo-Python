FROM python:3

WORKDIR /app

RUN apt update && \
    apt install libgl1-mesa-glx -y && \
    pip install -r requirements/prod.txt 

COPY main ./

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]