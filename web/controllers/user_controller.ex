defmodule PhoenixMazurka.UserController do
  use PhoenixMazurka.Web, :controller
  use Mazurka.Resource

  def index(conn, params) do
    accept = []
    {content, _, conn} = action(accept, params, params, conn, PhoenixMazurka.Router)
    json conn, content
  end

  param user, fn(id) ->
    %{id: id, name: "User #{id}"}
  end

  mediatype Hyper do
    action do
      %{
        "id" => user.id,
        "name" => user.name
      }
    end
  end
end
