# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bsdc,
  ecto_repos: [Bsdc.Repo]

# Configures the endpoint
config :bsdc, BsdcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zkVOZwxcSDgcjDJmMlgYk8KOcfx1r6cyhD/pUeFfeRwmvjo5bpblqq03cb0CIeEH",
  render_errors: [view: BsdcWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bsdc.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
