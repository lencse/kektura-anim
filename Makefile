.PHONY: dev

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

PORT=6600

NODE=node_modules
BIN=$(NODE)/.bin
TAILWIND_SRC_CSS=styles/tailwind.css
TAILWIND_DEV_CSS=styles/tailwind/tailwind.dev.css
TAILWIND_PROD_CSS=styles/tailwind/tailwind.prod.css
DIST=dist
TEMP_INDEX_HTML=index.html

default: $(DIST)

$(NODE): package.json yarn.lock
	yarn && touch $(NODE)

$(TEMP_INDEX_HTML):
	touch $(TEMP_INDEX_HTML)

$(DIST): $(NODE) $(TAILWIND_PROD_CSS) $(TEMP_INDEX_HTML)
	parcel build index.ejs

dev: $(NODE) $(TAILWIND_DEV_CSS)
	$(BIN)/concurrently \
		-n tailwind,parcel \
		-c bgBlue,bgMagenta \
		"$(BIN)/tailwind -w -i $(TAILWIND_SRC_CSS) -o $(TAILWIND_DEV_CSS)" \
		"parcel index.ejs"

$(TAILWIND_PROD_CSS): $(NODE) $(TAILWIND_SRC_CSS)
	NODE_ENV=production $(BIN)/tailwind -i $(TAILWIND_SRC_CSS) -o $(TAILWIND_PROD_CSS)

$(TAILWIND_DEV_CSS): $(NODE) $(TAILWIND_SRC_CSS)
	$(BIN)/tailwind -i $(TAILWIND_SRC_CSS) -o $(TAILWIND_DEV_CSS)
