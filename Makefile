test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint

linter-code-fix:
	bundle exec rubocop -A

check: lint test
