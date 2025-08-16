defmodule RefurbishWeb.PageController do
  use RefurbishWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
