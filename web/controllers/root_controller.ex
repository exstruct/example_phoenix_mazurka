defmodule PhoenixMazurka.RootController do
  use PhoenixMazurka.Web, :controller
  use Mazurka.Resource

  def index(conn, params) do
    accept = []
    {content, _, conn} = action(accept, params, params, conn, PhoenixMazurka.Router)
    json(conn, content)
  end

  mediatype Hyper do
    action do
      %{
        "hello" => "World",
        "account" => link_to("/users/:user", user: 123)
      }
    end
  end
end
