defmodule Web.PageController do
  use Web, :controller

  def index(conn, _params) do
    Metrics.HelloWorldTotal.command(:index)
    render(conn, "index.html")
  end
end
