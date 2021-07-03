install-tools:
	bash scripts/download-tools.sh

check-tools:
	bash scripts/check-tools.sh

run-local: check-tools
	consul agent -dev #-node ghost-machine

commpose-up:
	docker-compose up

commpose-start: commpose-up

open-ui:
	xdg-open http://127.0.0.1:8500/ui >/dev/null

