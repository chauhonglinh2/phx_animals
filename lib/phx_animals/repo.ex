defmodule PhxAnimals.Repo do
  use Ecto.Repo,
    otp_app: :phx_animals,
    adapter: Ecto.Adapters.Postgres
end
