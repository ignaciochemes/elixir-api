defmodule UsersWeb.UsuarioView do
  use UsersWeb, :view
  alias UsersWeb.UsuarioView

  def render("index.json", %{usuario: usuario}) do
    %{data: render_many(usuario, UsuarioView, "usuario.json")}
  end

  def render("show.json", %{usuario: usuario}) do
    %{data: render_one(usuario, UsuarioView, "usuario.json")}
  end

  def render("usuario.json", %{usuario: usuario}) do
    %{
      id: usuario.id,
      name: usuario.name,
      lastname: usuario.lastname,
      email: usuario.email,
      password: usuario.password
    }
  end
end
