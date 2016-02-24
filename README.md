### Rodar as migrations
docker-compose run migrate rake db:migrate


### Criar nova migration
docker-compose run migrate rake db:new_migration name="nome_migration"


### Rodar migrations em produção
docker-compose run -e RAILS_ENV='production' migrate rake db:migrate
