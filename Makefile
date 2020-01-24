GOPKG ?=	ultre.me/tenia-bot
DOCKER_IMAGE ?=	ultreme/tenia-bot
GOBINS ?=	.
NPM_PACKAGES ?=	.

PRE_INSTALL_STEPS += Lexique383.tsv

all: test install

-include rules.mk

Lexique383.tsv:
	wget http://www.lexique.org/databases/Lexique383/Lexique383.zip
	unzip Lexique383.zip Lexique383.tsv
	rm -f Lexique383.zip
