.PHONY: bootstrap start stop reset labs portal

bootstrap:
	./scripts/bootstrap-online.sh

start:
	./scripts/start.sh

stop:
	./scripts/stop.sh

reset:
	./scripts/reset-floci.sh

labs:
	python3 scripts/_generate_labs.py
	python3 scripts/_generate_labs_2.py
	python3 scripts/_generate_labs_3.py
	python3 scripts/_generate_labs_4.py

portal:
	cd portal && uvicorn app:app --reload --port 8080
