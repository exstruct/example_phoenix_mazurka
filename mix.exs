defmodule PhoenixMazurka.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_mazurka,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {PhoenixMazurka, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :gettext]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_html, "~> 2.6"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:mazurka, "~> 1.0.5"},
     {:mazurka_plug, "~> 0.1.1"}]
  end
end
