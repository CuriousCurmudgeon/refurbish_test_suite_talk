defmodule RefurbishTestSuiteTalkWeb.PageController do
  use RefurbishTestSuiteTalkWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
