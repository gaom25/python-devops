FROM python:3.8-slim as compile-image
COPY requirements.txt .
RUN pip install --user -r requirements.txt


FROM python:3.8-slim as build-image
COPY --from=compile-image /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

COPY . /app

LABEL name="python-devops"
WORKDIR /app

CMD ["python", "app.py"]