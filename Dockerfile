# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.10.12
FROM python:${PYTHON_VERSION}-slim as base

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


FROM base AS python-deps

RUN pip install --upgrade pip
RUN pip install poetry
COPY pyproject.toml .
COPY poetry.lock .
COPY poetry.toml .
RUN poetry install --only main
RUN poetry add gunicorn


FROM base AS runtime
# Copy virtual env from python-deps stage
SHELL ["/bin/bash", "-c"] 
COPY --from=python-deps /.venv /.venv
ENV PATH="/.venv/bin:$PATH"

# Create and switch to a new user
# RUN useradd --create-home appuser
WORKDIR /app

ENV ALLOWED_HOSTS="*"

# Install application into container
COPY . .
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
