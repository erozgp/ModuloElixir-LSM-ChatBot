defmodule Lsmchatbot.UsuarioTest do
  use Lsmchatbot.ModelCase

  alias Lsmchatbot.Usuario

  @valid_attrs %{identificador: "some content", nombreusuario: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @invalid_attrs)
    refute changeset.valid?
  end
end
