FROM python:3.6

RUN pip install gunicorn

COPY app/ /var/www/

RUN pip install -r /var/www/requirements.txt

COPY gunicorn.conf /etc/

WORKDIR /var/www/


ENTRYPOINT ["gunicorn"]

CMD ["-c", "/etc/gunicorn.conf", "app:app"]
