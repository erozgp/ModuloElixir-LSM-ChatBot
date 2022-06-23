defmodule Lsmchatbot.PageController do
  use Lsmchatbot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
