#base Image to use
FROM python:3.7.9-slim
#expose port 8080
EXPOSE 8080
#copy Requirements.txt file into app directory
COPY requirements.txt app/requirements.txt
#install all requirements in requirements.txt
RUN pip install -r app/requirements.txt
#copy all files in current directory into app directory
COPY . /app
#change Working Directory to app directory
WORKDIR /app
#run the application on port 8080
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080",
"--server.address=0.0.0.0"]
