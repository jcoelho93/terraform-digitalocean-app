.PHONY: fmt lint docs

fmt:
	terraform fmt -recursive

docs:
	terraform-docs markdown table . --output-file README.md

lint:
	docker run --rm --entrypoint sh ghcr.io/terraform-linters/tflint -c "tflint --init && tflint --recursive"

validate:
	terraform -chdir=tests/docker-app validate
