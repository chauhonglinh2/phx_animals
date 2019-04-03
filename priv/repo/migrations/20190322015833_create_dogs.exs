defmodule PhxAnimals.Repo.Migrations.CreateDogs do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add :age, :integer
      add :name, :string
      add :dog_attr, :string
      add :pack_id, :integer

      timestamps()
    end

  end
end
