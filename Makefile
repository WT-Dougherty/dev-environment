# ex: make setup
setup:
	./scripts/setup.sh

# ex: make build-local RAM=8g CPUS=4
build-local:
	./scripts/local-test.sh $(RAM) $(CPUS)

# ex: make default-build-local (uses defaults: 8g RAM, 4 CPUs)
default-build-local:
	./scripts/local-test.sh

connect-local:
	echo "Connecting to local cluster..."
	ssh admin@localhost -p 2222 -i ssh/access_key