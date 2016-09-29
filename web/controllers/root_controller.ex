defmodule PhoenixMazurka.RootController do
  use PhoenixMazurka.Web, :resource

  mediatype Hyper do
    action do
      %{
        "hello" => "World",
        "account" => link_to(PhoenixMazurka.UserController, user: 123)
      }
    end
  end
end
