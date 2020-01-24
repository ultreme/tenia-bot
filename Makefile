GOPKG ?=	ultre.me/tenia-bot
DOCKER_IMAGE ?=	ultreme/tenia-bot
GOBINS ?=	.
NPM_PACKAGES ?=	.

all: test install

-include rules.mk
