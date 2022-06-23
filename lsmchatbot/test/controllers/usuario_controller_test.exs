defmodule Lsmchatbot.UsuarioControllerTest do
  use Lsmchatbot.ConnCase

  alias Lsmchatbot.Usuario
  @valid_attrs %{identificador: "some content", nombreusuario: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, usuario_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing usuarios"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, usuario_path(conn, :new)
    assert html_response(conn, 200) =~ "New usuario"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, usuario_path(conn, :create), usuario: @valid_attrs
    assert redirected_to(conn) == usuario_path(conn, :index)
    assert Repo.get_by(Usuario, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, usuario_path(conn, :create), usuario: @invalid_attrs
    assert html_response(conn, 200) =~ "New usuario"
  end

  test "shows chosen resource", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = get conn, usuario_path(conn, :show, usuario)
    assert html_response(conn, 200) =~ "Show usuario"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, usuario_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = get conn, usuario_path(conn, :edit, usuario)
    assert html_response(conn, 200) =~ "Edit usuario"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = put conn, usuario_path(conn, :update, usuario), usuario: @valid_attrs
    assert redirected_to(conn) == usuario_path(conn, :show, usuario)
    assert Repo.get_by(Usuario, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = put conn, usuario_path(conn, :update, usuario), usuario: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit usuario"
  end

  test "deletes chosen resource", %{conn: conn} do
    usuario = Repo.insert! %Usuario{}
    conn = delete conn, usuario_path(conn, :delete, usuario)
    assert redirected_to(conn) == usuario_path(conn, :index)
    refute Repo.get(Usuario, usuario.id)
  end
end
