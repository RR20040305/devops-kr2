# Дефект 4 исправлен: фиксируем версию (slim-образ)
FROM python:3.12-slim

# Дефект 1 исправлен: создаем пользователя
RUN useradd --system --no-create-home app

WORKDIR /app

# Дефект 3 исправлен: сначала копируем только requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения
COPY app.py .

# Переключаемся на пользователя
USER app

# Дефект 2 исправлен: exec-форма CMD
CMD ["gunicorn", "--bind", "0.0.0.0:8003", "app:app"]
