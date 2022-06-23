# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lsmchatbot,
  ecto_repos: [Lsmchatbot.Repo]

# Configures the endpoint
config :lsmchatbot, Lsmchatbot.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WABo8KCDBG1ybwjAXuc8irt3/+HfdG2CpmWdh1RLVi8IzA5zvLmt+M2ZX29JCsDC",
  render_errors: [view: Lsmchatbot.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Lsmchatbot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
