build:
	docker rmi `docker images --filter dangling=true -q` || true
	docker build --progress=plain -t ansible-playbook .

test:
	docker rmi `docker images --filter dangling=true -q` || true
	docker build --progress=plain -t ansible-playbook .
	docker run --rm -u 0 -it -t ansible-playbook ansible-playbook playbook.yml --ask-vault-pass

interactive:
	docker rmi `docker images --filter dangling=true -q` || true
	docker build --progress=plain -t ansible-playbook .
	docker run --rm -u 0 -it -t ansible-playbook bash
