#!/bin/bash
set -e

echo "Waiting for MySQL to be ready..."

while ! nc -z mysql 3306; do
  echo "MySQL is unavailable — sleeping"
  sleep 2
done

echo "MySQL is up — running migrations"
bundle exec rails db:create db:migrate

echo "Starting Rails server..."
exec "$@"

