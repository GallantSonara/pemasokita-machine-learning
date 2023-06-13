FROM python:3.10.10

RUN apt-get update && apt-get install -y libgl1-mesa-glx

WORKDIR /app

ENV PIP_ROOT_USER_ACTION=ignore

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 80

ENV PYTHONUNBUFFERED=1

CMD ["python", "main.py"]

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--PORT", "8080"]
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--PORT", "80"]
app.run(port=int(os.environ.get("PORT", 8080)),host='0.0.0.0',debug=True)
