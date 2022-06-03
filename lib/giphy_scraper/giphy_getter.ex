defmodule GiphyScraper.GiphyGetter do
  @moduledoc false


  @type error :: :wrong_api_key | :not_decoded | String.t()

  @spec query_api_and_decode_json_response(String.t(), pos_integer()) ::
          {:ok, map} | {:error, error()}
  def query_api_and_decode_json_response(query, limit \\ 25) do
    with {:ok, body} <- request_gifs(query, limit),
         {:ok, data} <- decode_json(body) do
          {:ok, data}
    end
  end


  defp request_gifs(query, limit) do
    case HTTPoison.get("api.giphy.com/v1/gifs/search", [],
           params: [api_key: api_key(), q: query, limit: limit]
         ) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 403}} -> {:error, :wrong_api_key}
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
