defmodule PhxAnimals.Dogs.Dog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dogs" do
    field :age, :integer
    field :dog_attr, :string
    field :name, :string
    field :pack_id, :integer

    timestamps()
  end

  @doc false
  def changeset(dog, attrs) do
    dog
    |> cast(attrs, [:age, :name, :dog_attr, :pack_id])
    |> validate_required([:age, :name, :dog_attr, :pack_id])
  end
end
