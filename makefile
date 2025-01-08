# Makefile

# Paths
CLIENT_DIST=client/dist
SERVER_RESOURCES_PATH=server/src/main/resources/
SERVER_TEMPLATES=server/src/main/resources/templates
SERVER_STATIC=server/src/main/resources/static/assets

# Default target
.PHONY: dev
dev: copy-templates run-server

# Copy templates and static assets
.PHONY: copy-templates
copy-templates:
#	@echo "Copying templates from $(CLIENT_DIST)/pages to $(SERVER_TEMPLATES)..."
#	mkdir -p $(SERVER_TEMPLATES)
#	cp -r $(CLIENT_DIST)/pages/* $(SERVER_TEMPLATES)
	@echo "Copying static assets from $(CLIENT_DIST)/assets to $(SERVER_STATIC)..."
	mkdir -p $(SERVER_STATIC)
	cp -r $(CLIENT_DIST)/assets/* $(SERVER_STATIC)
	@echo "Copying static assets from $(CLIENT_DIST)/assets to $(SERVER_RESOURCES_PATH)..."
	mkdir -p $(SERVER_RESOURCES_PATH)
	cp -r $(CLIENT_DIST) $(SERVER_RESOURCES_PATH)


# Run Spring Boot server
.PHONY: run-server
run-server:
	@echo "Running Spring Boot server..."
	#cd server && ./gradlew bootRun
