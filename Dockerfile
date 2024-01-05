FROM python:3.11
WORKDIR /app
ADD . /app
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]