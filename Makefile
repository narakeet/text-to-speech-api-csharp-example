DOCKER_IMAGE_NAME ?= mcr.microsoft.com/dotnet/sdk:6.0
MAKE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER_RUN := docker run --rm -v $(MAKE_DIR):/work -w /work 
RUN := $(DOCKER_RUN) $(DOCKER_IMAGE_NAME)

execute: NarakeetExample/bin/Release/net6.0/NarakeetExample.dll
	$(RUN) dotnet run --project NarakeetExample $(API_KEY)

NarakeetExample/bin/Release/net6.0/NarakeetExample.dll: NarakeetExample/Program.cs 
	$(RUN) dotnet publish -c Release

init:
	docker pull $(DOCKER_IMAGE_NAME)

bootstrap:
	$(RUN) dotnet new console --name NarakeetExample
	$(RUN) dotnet new sln --name NarakeetExample
	$(RUN) dotnet sln NarakeetExample.sln add NarakeetExample/NarakeetExample.csproj

shell:
	$(DOCKER_RUN) -it $(DOCKER_IMAGE_NAME)

build: NarakeetExample/bin/Release/net6.0/NarakeetExample.dll

.PHONY: build shell bootstrap init execute
