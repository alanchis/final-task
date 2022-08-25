FROM python:3.9

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install Flask gunicorn
RUN python3 -m pip install SQLAlchemy Flask-SQLAlchemy

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app