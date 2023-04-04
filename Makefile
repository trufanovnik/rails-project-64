test:
	bin/rails test

lint:
	bundle exec rubocop
	slim-lint app/views/

linter-code-fix:
	bundle exec rubocop -A

check: lint test
