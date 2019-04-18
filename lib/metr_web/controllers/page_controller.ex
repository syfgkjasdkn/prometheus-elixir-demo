defmodule MetrWeb.PageController do
  use MetrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
