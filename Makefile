test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

ci-setup:
	npm ci
	npm run build
	bundle

check: lint test
