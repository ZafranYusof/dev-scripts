.PHONY: setup test deploy lint clean

setup:
	@bash scripts/dev-setup.sh

test:
	@bash scripts/test-runner.sh

deploy:
	@bash scripts/deploy.sh

lint:
	@shellcheck scripts/*.sh

clean:
	@rm -rf tmp/ logs/ coverage/
	@echo "Cleaned build artifacts"