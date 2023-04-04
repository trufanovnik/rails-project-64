test:
	bin/rails test

lint:
	bundle exec rubocop

linter-code-fix:
	bundle exec rubocop -A

check: lint test
