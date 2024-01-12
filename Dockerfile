# app/Dockerfile
# use the ECR repo base-image link
FROM 570580688935.dkr.ecr.ca-central-1.amazonaws.com/python:3.10-slim-buster 
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt &&\
    apt-get update -y &&\
    apt-get install curl -y 
COPY . .
EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health
# replace YourWebApp.py with the relevant file name
ENTRYPOINT ["streamlit", "run", "webapp.py", "--server.port=8501", "--server.address=0.0.0.0"]
