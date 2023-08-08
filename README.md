# Application Builder Api Server

## Installing

- Install dependencies with `mix deps.get`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Run `mix ecto.create` to create the database
- Run `mix ecto.migrate` to run database migrations
- If you run into issues with compiling elixir run `mix local.rebar`
- Run `iex -S mix phx.server` or `mix phx.server`


# Build
docker build . -t appbuilder

# Run
docker run -p 5000:4000 -d appbuilder

## Running in Development

```
iex -S mix phx.server
```

## Run Postgres Database

# Postgres Database as a docker container

- `docker run --name pixel-auth-postgres -p 5433:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -d postgres`

# Postgres Database Client with PGAdmin as a docker container

- `docker pull dpage/pgadmin4`
- docker run -p 8080:80 \
   -e "PGADMIN_DEFAULT_EMAIL=some_email@domain.com" \
   -e "PGADMIN_DEFAULT_PASSWORD=postgres" \
   -d dpage/pgadmin4
- For pgadmin configuration to connect to authentication database you must specify hostname `host.docker.internal` and port 5433

## Run MS Sql Server Database

`docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=5678mangoplatform@" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-CU13-ubuntu-20.04`
