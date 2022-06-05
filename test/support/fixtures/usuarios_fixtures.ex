defmodule Users.UsuariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Users.Usuarios` context.
  """

  @doc """
  Generate a unique usuario description.
  """
  def unique_usuario_description, do: "some description#{System.unique_integer([:positive])}"

  @doc """
  Generate a usuario.
  """
  def usuario_fixture(attrs \\ %{}) do
    {:ok, usuario} =
      attrs
      |> Enum.into(%{
        description: unique_usuario_description()
      })
      |> Users.Usuarios.create_usuario()

    usuario
  end

  @doc """
  Generate a unique usuario email.
  """
  def unique_usuario_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a usuario.
  """
  def usuario_fixture(attrs \\ %{}) do
    {:ok, usuario} =
      attrs
      |> Enum.into(%{
        email: unique_usuario_email(),
        lastname: "some lastname",
        name: "some name",
        password: "some password"
      })
      |> Users.Usuarios.create_usuario()

    usuario
  end
end
