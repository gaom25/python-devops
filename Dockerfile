FROM python
COPY . /app
WORKDIR /app

RUN pip install -r requiremets.txt
CMD ["python", "app.py"]