defmodule PhoenixMazurka.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use PhoenixMazurka.Web, :controller
      use PhoenixMazurka.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller

      alias PhoenixMazurka.Repo

      import PhoenixMazurka.Router.Helpers
      import PhoenixMazurka.Gettext
    end
  end

  def resource do
    quote do
      import Plug.Conn
      use Phoenix.Controller.Pipeline

      use Mazurka.Resource
      use Mazurka.Plug, router_key: :phoenix_router, plug_init: false
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import PhoenixMazurka.Router.Helpers
      import PhoenixMazurka.ErrorHelpers
      import PhoenixMazurka.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
