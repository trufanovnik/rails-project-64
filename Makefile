test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

ci-setup:
	cp -n .env.example .env || true
	npm ci
	npm run build
	bundle

check: lint test
