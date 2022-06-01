defmodule GiphyScraper do
  @moduledoc """
  Returns giphys from giphy.com based on the query term
  """
  alias GiphyScraper.{GiphyGetter, GiphyImage}

  @spec search(String.t(), pos_integer()) ::
          {:ok, [GiphyImage.t()]} | {:error, GiphyGetter.error()}
  defdelegate search(query, limit \\ 25),
    to: GiphyGetter,
    as: :query_api_and_decode_json_response
end
