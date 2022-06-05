defmodule Users.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuario) do
      add :name, :string
      add :lastname, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:usuario, [:email])
  end
end
