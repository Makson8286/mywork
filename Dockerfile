FROM python:alpine

WORKDIR /app

COPY . .

CMD ["python", "cod.py"]
