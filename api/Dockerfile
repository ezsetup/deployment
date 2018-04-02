FROM python:3.6.2

COPY gunicorn.conf /etc/

RUN pip install gunicorn~=19.7.1 pipenv

COPY app/ /var/www/

COPY run.sh /var/www/

WORKDIR /var/www/

RUN pipenv install --system

RUN chmod +x ./run.sh

ENTRYPOINT ["./run.sh"]
