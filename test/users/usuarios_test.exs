defmodule Users.UsuariosTest do
  use Users.DataCase

  alias Users.Usuarios

  describe "usuario" do
    alias Users.Usuarios.Usuario

    import Users.UsuariosFixtures

    @invalid_attrs %{description: nil}

    test "list_usuario/0 returns all usuario" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuario() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(valid_attrs)
      assert usuario.description == "some description"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.update_usuario(usuario, update_attrs)
      assert usuario.description == "some updated description"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end

  describe "usuario" do
    alias Users.Usuarios.Usuario

    import Users.UsuariosFixtures

    @invalid_attrs %{email: nil, lastname: nil, name: nil, password: nil}

    test "list_usuario/0 returns all usuario" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuario() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      valid_attrs = %{email: "some email", lastname: "some lastname", name: "some name", password: "some password"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(valid_attrs)
      assert usuario.email == "some email"
      assert usuario.lastname == "some lastname"
      assert usuario.name == "some name"
      assert usuario.password == "some password"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      update_attrs = %{email: "some updated email", lastname: "some updated lastname", name: "some updated name", password: "some updated password"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.update_usuario(usuario, update_attrs)
      assert usuario.email == "some updated email"
      assert usuario.lastname == "some updated lastname"
      assert usuario.name == "some updated name"
      assert usuario.password == "some updated password"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end
end
