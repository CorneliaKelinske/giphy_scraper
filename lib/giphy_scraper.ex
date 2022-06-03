defmodule GiphyScraper do
  @moduledoc """
  Returns giphys from giphy.com based on the query term
  """
  alias GiphyScraper.{GiphyGetter, GiphyImage}

  @spec search(String.t(), pos_integer()) ::
          {:ok, [GiphyImage.t()]} | {:error, GiphyGetter.error()}
  def search(query, limit \\ 25) do
    with {:ok, data} <- GiphyGetter.query_api_and_decode_json_response(query, limit) do
      images = Enum.map(data, &GiphyImage.new/1)
      {:ok, images}
    end
  end
end
