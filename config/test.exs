use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_animals, PhxAnimalsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phx_animals, PhxAnimals.Repo,
  username: System.get_env("POSTGRESQL_USERNAME"),
  password: System.get_env("POSTGRESQL_PASSWORD"),
  database: "phx_animals_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
