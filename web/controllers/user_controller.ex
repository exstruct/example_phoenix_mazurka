defmodule PhoenixMazurka.UserController do
  use PhoenixMazurka.Web, :resource

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
