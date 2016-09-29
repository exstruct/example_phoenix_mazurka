defmodule PhoenixMazurka.Router do
  use PhoenixMazurka.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixMazurka do
    pipe_through :api

    get "/", RootController, :index
    get "/users/:user", UserController, :index
  end

  def resolve_resource("/", _source, _conn) do
    PhoenixMazurka.RootController
  end
  def resolve_resource("/users/:user", _source, _conn) do
    PhoenixMazurka.UserController
  end

  def resolve(%{resource: PhoenixMazurka.RootController} = affordance, _source, _conn) do
    %{affordance | method: "GET", path: "/"}
  end
  def resolve(%{resource: PhoenixMazurka.UserController, params: %{"user" => user}} = affordance, _source, _conn) do
    %{affordance | method: "GET", path: "/users/#{user}"}
  end
end
