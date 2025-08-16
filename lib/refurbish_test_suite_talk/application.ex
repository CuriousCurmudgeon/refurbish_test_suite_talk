defmodule RefurbishTestSuiteTalk.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RefurbishTestSuiteTalkWeb.Telemetry,
      RefurbishTestSuiteTalk.Repo,
      {DNSCluster, query: Application.get_env(:refurbish_test_suite_talk, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RefurbishTestSuiteTalk.PubSub},
      # Start a worker by calling: RefurbishTestSuiteTalk.Worker.start_link(arg)
      # {RefurbishTestSuiteTalk.Worker, arg},
      # Start to serve requests, typically the last entry
      RefurbishTestSuiteTalkWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RefurbishTestSuiteTalk.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RefurbishTestSuiteTalkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
