# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :appbuilder,
  ecto_repos: [Appbuilder.Repo],
  generators: [binary_id: true]

  config :cors_plug,
  origin: ["*"],
  max_age: 86400,
  methods: ["GET", "POST", "PUT", "DELETE"]

# Configures the endpoint
config :appbuilder, AppbuilderWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: AppbuilderWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Appbuilder.PubSub,
  live_view: [signing_salt: "Fx8MxRMp"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :appbuilder, Appbuilder.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
