defmodule GiphyScraper.GiphyGetter do
  @moduledoc false

  alias GiphyScraper.FinchHelpers

  @type error :: :wrong_api_key | :not_decoded | String.t()

  @url "https://api.giphy.com/v1/gifs/search"
  @params %{api_key: nil, q: nil, limit: nil}

  @spec query_api_and_decode_json_response(String.t(), pos_integer()) ::
          {:ok, map} | {:error, error()}
  def query_api_and_decode_json_response(query, limit \\ 25) do
    with {:ok, body} <- request_gifs(query, limit),
         {:ok, data} <- decode_json(body) do
      {:ok, data}
    end
  end

  defp request_gifs(query, limit) do
    %{@params | api_key: api_key(), q: query, limit: limit}
    |> FinchHelpers.build_query(@url)
    |> Finch.request(GiphyScraper.Finch)
    |> case do
      {:ok, %Finch.Response{status: 200, body: body}} -> {:ok, body}
      {:ok, %Finch.Response{status: 401}} -> {:error, :api_key_not_found}
      error -> {:error, inspect(error)}
    end
  end

  defp api_key do
    Application.get_env(:giphy_scraper, :api_key)
  end

  defp decode_json(body) do
    case Jason.decode(body) do
      {:ok, %{"data" => data}} -> {:ok, data}
      _ -> {:error, :not_decoded}
    end
  end
end
