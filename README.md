
### Create a docker-compose.yml on your project

```
migrate:
  image: webgoal/standalone-migrations
  volumes:
    - ./db:/opt/migrations/db
```

As in the example you must have a 'db' folder in the same directory

### Create a config.yml inside the 'db' folder

```
development:
  adapter: mysql2
  encoding: utf8
  database: database_development
  username: user
  password: pass
  host: 192.168.1.2

production:
  adapter: mysql2
  encoding: utf8
  database: database_production
  username: user
  password: pass
  host: 192.168.1.3
```

### Restore an existing database

```
docker-compose run db mysql -hdb -pmypass database_development < ./db/structure.sql
```

### Create a new migration

```
docker-compose run migrate rake db:new_migration name="migration_name"
```

### Run migrations

```
docker-compose run migrate rake db:migrate
```

### Run migrations in production

```
docker-compose run -e RAILS_ENV='production' migrate rake db:migrate
```
