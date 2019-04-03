defmodule PhxAnimals.DogsTest do
  use PhxAnimals.DataCase

  alias PhxAnimals.Dogs

  describe "dogs" do
    alias PhxAnimals.Dogs.Dog

    @valid_attrs %{age: 42, dog_attr: "some dog_attr", name: "some name", pack_id: 42}
    @update_attrs %{age: 43, dog_attr: "some updated dog_attr", name: "some updated name", pack_id: 43}
    @invalid_attrs %{age: nil, dog_attr: nil, name: nil, pack_id: nil}

    def dog_fixture(attrs \\ %{}) do
      {:ok, dog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Dogs.create_dog()

      dog
    end

    test "list_dogs/0 returns all dogs" do
      dog = dog_fixture()
      assert Dogs.list_dogs() == [dog]
    end

    test "get_dog!/1 returns the dog with given id" do
      dog = dog_fixture()
      assert Dogs.get_dog!(dog.id) == dog
    end

    test "create_dog/1 with valid data creates a dog" do
      assert {:ok, %Dog{} = dog} = Dogs.create_dog(@valid_attrs)
      assert dog.age == 42
      assert dog.dog_attr == "some dog_attr"
      assert dog.name == "some name"
      assert dog.pack_id == 42
    end

    test "create_dog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dogs.create_dog(@invalid_attrs)
    end

    test "update_dog/2 with valid data updates the dog" do
      dog = dog_fixture()
      assert {:ok, %Dog{} = dog} = Dogs.update_dog(dog, @update_attrs)
      assert dog.age == 43
      assert dog.dog_attr == "some updated dog_attr"
      assert dog.name == "some updated name"
      assert dog.pack_id == 43
    end

    test "update_dog/2 with invalid data returns error changeset" do
      dog = dog_fixture()
      assert {:error, %Ecto.Changeset{}} = Dogs.update_dog(dog, @invalid_attrs)
      assert dog == Dogs.get_dog!(dog.id)
    end

    test "delete_dog/1 deletes the dog" do
      dog = dog_fixture()
      assert {:ok, %Dog{}} = Dogs.delete_dog(dog)
      assert_raise Ecto.NoResultsError, fn -> Dogs.get_dog!(dog.id) end
    end

    test "change_dog/1 returns a dog changeset" do
      dog = dog_fixture()
      assert %Ecto.Changeset{} = Dogs.change_dog(dog)
    end
  end
end
