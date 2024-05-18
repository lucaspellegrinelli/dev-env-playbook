test:
	@if [ ! -f vault-pass.txt ]; then echo "vault-pass.txt not found. Please create it."; exit 1; fi
	@docker build --no-cache --build-arg ARCH=$(shell uname -m) -t dev-env-playbook --progress=plain .
	@docker run -p 8080:8080 --rm dev-env-playbook

run:
	ansible-playbook playbook.yml --ask-vault-pass --ask-become-pass
