defmodule GiphyScraper.MixProject do
  use Mix.Project

  def project do
    [
      app: :giphy_scraper,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        dialyzer: :dev,
        coveralls: :dev,
        credo: :dev,
        check: :dev
      ],
      dialyzer: [
        plt_add_apps: [:ex_unit, :mix],
        list_unused_filters: true,
        flags: [:unmatched_returns, :no_improper_lists]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GiphyScraper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:dialyxir, "~> 1.1", only: :dev, runtime: false},
      {:ex_check, "~> 0.14.0", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: :dev, runtime: false}
    ]
  end
end
