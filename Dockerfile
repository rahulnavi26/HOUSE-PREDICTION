FROM python:3.8-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FLASK_APP=app.py

COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt

COPY app.py house.py model.pkl house_data.csv ./
COPY templates ./templates
COPY static ./static

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]