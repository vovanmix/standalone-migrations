
### Create a docker-compose.yml on your project root

```
migrate:
  image: webgoal/standalone-migrations
  volumes:
    - ./db:/opt/migrations/db
```

- In your project should have a folder 'db'

### Create a config.yml inside the db folder

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

### Create a database

- To dump the base and place inside the db folder

```
docker-compose run db mysql -hdb -pmypass database_developer < ../../db/structure.sql
```

### Create a new migration

```
docker-compose run migrate rake db:new_migration name="migration_name"
```

### Run migrations

```
docker-compose run migrate rake db:migrate
```

### Run migrations in a production

```
docker-compose run -e RAILS_ENV='production' migrate rake db:migrate
```
