FROM python:3.10.10

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 80

ENV PYTHONUNBUFFERED=1

ENV PIP_ROOT_USER_ACTION=ignore

# CMD ["python", "-u", "main.py"]

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "80", "main:app"]
