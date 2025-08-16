defmodule Refurbish.Repo do
  use Ecto.Repo,
    otp_app: :refurbish,
    adapter: Ecto.Adapters.Postgres
end
