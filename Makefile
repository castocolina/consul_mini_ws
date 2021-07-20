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

add-data:
	bash -x scripts/consul-init-data.sh

exercise1:
	bash -x reading/exercise1/entry.sh

exercise2:
	bash -x reading/exercise2/entry.sh
