defmodule Lsmchatbot.Usuario do
  use Lsmchatbot.Web, :model

  schema "usuarios" do
    field :nombreusuario, :string
    field :identificador, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombreusuario, :identificador])
    |> validate_required([:nombreusuario, :identificador])
  end
end
