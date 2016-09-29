# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_mazurka,
  ecto_repos: []

# Configures the endpoint
config :phoenix_mazurka, PhoenixMazurka.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z/gGPl+sTC4QqopPAPfvs4j3LTNcB/yqvzQKeMgsbWC6zvEqIV9swC5RV5ps4yWD",
  render_errors: [view: PhoenixMazurka.ErrorView, accepts: ~w(html json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
