DIR := ${CURDIR}

all: run

build:
	docker build -t nist .

run: build
	docker run -it -v $(DIR):/data nist python
	
