test:
	bin/rails test

lint:
	bundle install
	bundle exec rubocop
	bundle exec slim-lint app/views/

linter-code-fix:
	bundle exec rubocop -A

check: lint test
