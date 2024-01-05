# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in pyproject.toml
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]