defmodule RefurbishTestSuiteTalk.Repo do
  use Ecto.Repo,
    otp_app: :refurbish_test_suite_talk,
    adapter: Ecto.Adapters.Postgres
end
