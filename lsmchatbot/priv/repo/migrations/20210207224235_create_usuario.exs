defmodule Lsmchatbot.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombreusuario, :string
      add :identificador, :string

      timestamps()
    end

  end
end
