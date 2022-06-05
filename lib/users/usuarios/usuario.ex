defmodule Users.Usuarios.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuario" do
    field :email, :string
    field :lastname, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:name, :lastname, :email, :password])
    |> validate_required([:name, :lastname, :email, :password])
    |> unique_constraint(:email)
  end
end
