FROM python:3

WORKDIR /app

COPY main requirements ./

# https://github.com/conda-forge/pygridgen-feedstock/issues/10#issuecomment-365914605
RUN apt-get update && \
    apt-get install libgl1-mesa-glx -y && \
    pip install -r prod.txt 

CMD ["flask", "run", "--host=0.0.0.0"]
