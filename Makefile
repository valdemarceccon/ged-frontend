setup:
	docker volume create nodemodules
install:
	docker-compose -f docker-compose.build.yml run install
dev:
	docker-compose up
bash:
	docker-compose run --rm dev bash
