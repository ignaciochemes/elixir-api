defmodule UsersWeb.UsuarioController do
  use UsersWeb, :controller

  alias Users.Usuarios
  alias Users.Usuarios.Usuario

  action_fallback UsersWeb.FallbackController

  def index(conn, _params) do
    usuario = Usuarios.list_usuario()
    render(conn, "index.json", usuario: usuario)
  end

  def create(conn, %{"usuario" => usuario_params}) do
    findUser = Usuarios.get_user_by_email!(usuario_params["email"])
    if findUser != nil do
      json(conn, %{error: "El usuario ya existe"})
    end
    if findUser == nil do
      hashed_password = HashPassword.hashing_password(usuario_params["password"])
      newUser = %{usuario_params | "password" => hashed_password}
      with {:ok, %Usuario{} = newUser} <- Usuarios.create_usuario(newUser) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.usuario_path(conn, :show, newUser))
        |> render("show.json", usuario: newUser)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)
    render(conn, "show.json", usuario: usuario)
  end

  def update(conn, %{"id" => id, "usuario" => usuario_params}) do
    usuario = Usuarios.get_usuario!(id)

    with {:ok, %Usuario{} = usuario} <- Usuarios.update_usuario(usuario, usuario_params) do
      render(conn, "show.json", usuario: usuario)
    end
  end

  def delete(conn, %{"id" => id}) do
    usuario = Usuarios.get_usuario!(id)

    with {:ok, %Usuario{}} <- Usuarios.delete_usuario(usuario) do
      send_resp(conn, :no_content, "")
    end
  end
end
