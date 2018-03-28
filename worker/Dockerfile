FROM python:3.6.2

RUN pip install pipenv

COPY app/ /var/www/

WORKDIR /var/www/

RUN pipenv install --system


ENTRYPOINT ["rq"]

CMD ["worker", "-c", "backgroundjobs.settings"]
