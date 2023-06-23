defmodule GiphyScraper.MixProject do
  use Mix.Project

  def project do
    [
      app: :giphy_scraper,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_apps: [:ex_unit, :mix, :credo, :jason],
        list_unused_filters: true,
        plt_local_path: "dialyzer",
        plt_core_path: "dialyzer"
      ],
      preferred_cli_env: [
        dialyzer: :test,
        check: :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        doctor: :test
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

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:dialyxir, "~> 1.1", only: :test, runtime: false},
      {:ex_check, "~> 0.14.0", only: :test, runtime: false},
      {:credo, "~> 1.6", only: [:test, :dev], runtime: false},
      {:blitz_credo_checks, "~> 0.1", only: [:test, :dev], runtime: false},
      {:finch, "~> 0.13.0"},
      {:sandbox_registry, "~> 0.1.1"},
      {:error_message, "~> 0.2.0"}
    ]
  end
end
