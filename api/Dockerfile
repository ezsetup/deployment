FROM python:3.6.2

COPY gunicorn.conf /etc/

RUN pip install gunicorn~=19.7.1 pipenv

COPY app/ /var/www/

WORKDIR /var/www/

RUN pipenv install --system

ENTRYPOINT ["python create_root.py && gunicorn -c /etc/gunicorn.conf app:app"]
