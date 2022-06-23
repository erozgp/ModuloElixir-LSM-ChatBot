defmodule Lsmchatbot.UsuarioController do
  use Lsmchatbot.Web, :controller

  alias Lsmchatbot.Usuario

  def index(conn, _params) do
    usuarios = Repo.all(Usuario)
    render(conn, "index.html", usuarios: usuarios)
  end

  def new(conn, _params) do
    changeset = Usuario.changeset(%Usuario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"usuario" => usuario_params}) do
    changeset = Usuario.changeset(%Usuario{}, usuario_params)

    case Repo.insert(changeset) do
      {:ok, _usuario} ->
        conn
        |> put_flash(:info, "Usuario created successfully.")
        |> redirect(to: usuario_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    usuario = Repo.get!(Usuario, id)
    render(conn, "show.html", usuario: usuario)
  end

  def edit(conn, %{"id" => id}) do
    usuario = Repo.get!(Usuario, id)
    changeset = Usuario.changeset(usuario)
    render(conn, "edit.html", usuario: usuario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "usuario" => usuario_params}) do
    usuario = Repo.get!(Usuario, id)
    changeset = Usuario.changeset(usuario, usuario_params)

    case Repo.update(changeset) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario updated successfully.")
        |> redirect(to: usuario_path(conn, :show, usuario))
      {:error, changeset} ->
        render(conn, "edit.html", usuario: usuario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuario = Repo.get!(Usuario, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(usuario)

    conn
    |> put_flash(:info, "Usuario deleted successfully.")
    |> redirect(to: usuario_path(conn, :index))
  end
end
