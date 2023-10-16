FROM public.ecr.aws/docker/library/python:3.10-alpine

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt


RUN pip install --upgrade pip setuptools
RUN pip install -r requirements.txt

ENV DB_USERNAME=postgresql \
    DB_PASSWORD=s953QKgDL9 


COPY ./analytics .

CMD python app.py