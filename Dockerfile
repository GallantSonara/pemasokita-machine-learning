FROM python:3.10.10

RUN apt-get update && apt-get install -y libgl1-mesa-glx

WORKDIR /app

ENV PIP_ROOT_USER_ACTION=ignore

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

ENV PORT=8080

EXPOSE 8080

ENV PYTHONUNBUFFERED=1

# CMD ["python", "-u", "main.py"]

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
