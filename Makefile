all: run

build:
	docker build -t nist .

run: build
	docker run -it nist python
