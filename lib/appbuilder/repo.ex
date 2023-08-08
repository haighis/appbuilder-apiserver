defmodule Appbuilder.Repo do
  use Ecto.Repo,
    otp_app: :appbuilder,
    adapter: Ecto.Adapters.Postgres
end
