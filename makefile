.PHONY: build dev serve

build:
	@sh build.sh

dev:
	npx -y @11ty/eleventy --serve

serve: build
	npx -y serve docs/
