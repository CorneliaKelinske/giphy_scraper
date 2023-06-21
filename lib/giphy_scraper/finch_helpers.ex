defmodule GiphyScraper.FinchHelpers do
  @moduledoc """
  Functions for building an API call through Finch
  """
  @type params :: %{api_key: String.t() | nil, q: String.t() | nil, limit: pos_integer} | []

  # Finch.build(:get, "https://api.giphy.com/v1/gifs/search?api_key=#{api_key()}&q=#{query}&limit=#{limit}")

  @spec build_query(params(), String.t()) :: Finch.Request.t()
  def build_query(params, url) do
    url
    |> append_params(params)
    |> String.trim_trailing("&")
    |> then(fn x -> Finch.build(:get, x) end)
  end

  defp append_params(query, []) do
    query
  end

  defp append_params(query, params) do
    Enum.reduce(params, "#{query}?", fn {k, v}, acc -> acc <> "#{k}=#{v}&" end)
  end
end
