FROM python:stretch

COPY . /app
WORKDIR /app

RUN python3 -m venv /opt/venv
RUN pip install --upgrade pip

ENV PATH="/opt/venv/bin:$PATH"
# Install dependencies:
COPY requirements.txt .
RUN /opt/venv/bin/pip install -r requirements.txt
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]