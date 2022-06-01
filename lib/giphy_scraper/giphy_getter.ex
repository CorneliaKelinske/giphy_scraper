defmodule GiphyScraper.GiphyGetter do
  alias GiphyScraper.GiphyImage

  def query_giphy_api_and_turn_json_results_into_the_nice_image_struct(query, limit \\ 25) do
    with {:ok, body} <- get_gifs(query, limit),
         {:ok, data} <- decode_json(body) do
      {:ok, map_to_image_struct(data)}
    end
  end

  defp api_key() do
    Application.get_env(:giphy_scraper, :api_key)
  end

  defp get_gifs(query, limit) do
    case HTTPoison.get("api.giphy.com/v1/gifs/search", [],
           params: [api_key: api_key(), q: query, limit: limit]
         ) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} -> {:error, :not_found}
      {:ok, %HTTPoison.Response{status_code: 403}} -> {:error, :wrong_api_key}
      error -> {:error, error}
    end
  end

  defp decode_json(body) do
    case Jason.decode(body) do
      {:ok, %{"data" => data}} -> {:ok, data}
      _ -> {:error, :not_decoded}
    end
  end

  defp map_to_image_struct(data) do
    Enum.map(data, fn %{"id" => id, "url" => url, "username" => username, "title" => title} ->
      %GiphyImage{id: id, url: url, username: username, title: title}
    end)
  end
end
