APP_REPO ?= quay.io/synpse/azure-iot-hub-example

.PHONY: image
image:
	docker buildx build --platform linux/amd64,linux/arm64 -t ${APP_REPO}:latest --push -f Dockerfile .

pyenv:
	python3 -m venv pyenv
	. pyenv/bin/activate && \
	pip install -U pip wheel

run: pyenv
	. pyenv/bin/activate && \
	cd gateway/ && \
	pip install -r requirements.txt && \
	python azure.py