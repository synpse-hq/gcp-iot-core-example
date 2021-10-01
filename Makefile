APP_REPO ?= quay.io/synpse/gcp-iot-hub-example

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
	python gateway/gcp.py --device_id synpse --private_key_file ./../ec_private.pem --cloud_region=us-central1 --registry_id synpse-registry --project_id iot-hub-326815 --algorithm ES256 --message_type state