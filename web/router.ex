defmodule PhoenixMazurka.Router do
  use PhoenixMazurka.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixMazurka do
    pipe_through :api

    get "/", RootController, :action
    get "/users/:user", UserController, :action
  end

  def resolve(%{resource: PhoenixMazurka.RootController} = affordance, _source, conn) do
    path = __MODULE__.Helpers.root_path(conn, :action)
    affordance
    |> update_affordance("GET", path, conn)
  end
  def resolve(%{resource: PhoenixMazurka.UserController, params: %{"user" => user}} = affordance, _source, conn) do
    path = __MODULE__.Helpers.user_path(conn, :action, user)
    affordance
    |> update_affordance("GET", path, conn)
  end

  defp update_affordance(affordance, method, path, conn) do
    affordance
    |> Mazurka.Plug.update_affordance(conn)
    |> Map.merge(%{method: method, path: path})
  end
end
