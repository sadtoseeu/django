FROM python:3.10

RUN apt-get update \
	&& apt-get install -y git

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN git clone https://github.com/sadtoseeu/django.git

WORKDIR /usr/src/app/django/app

EXPOSE 8000
#CMD sleep 999
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]