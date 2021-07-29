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
	xdg-open http://127.0.0.1:8500/ui >/dev/null || open http://127.0.0.1:8500/ui

load-data: add-data

init-data: add-data

add-data:
	bash -x scripts/consul-init-data.sh

exercise1:
	bash -x reading/exercise1/entry.sh

exercise2:
	bash -x reading/exercise2/entry.sh

exercise3:
	bash -x reading/exercise3/entry.sh

exercise4:
	bash -x reading/exercise4/entry.sh

exercise5:
	bash -x reading/exercise5/entry.sh

open-exercise3:
	xdg-open http://127.0.0.1:3000 >/dev/null || open http://127.0.0.1:3000

open-exercise4:
	xdg-open http://127.0.0.1:8080/greeting >/dev/null || open http://127.0.0.1:8080/greeting

open-exercise5:
	( xdg-open http://127.0.0.1:8081/greeting >/dev/null ) \
	|| ( open http://127.0.0.1:8081/greeting >/dev/null )
