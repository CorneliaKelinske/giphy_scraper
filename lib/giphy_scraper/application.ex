defmodule GiphyScraper.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: GiphyScraper.Finch}
    ]

    opts = [strategy: :one_for_one, name: GiphyScraper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
