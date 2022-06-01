defmodule GiphyScraper do
  @moduledoc """
  Documentation for `GiphyScraper`.
  """
  alias GiphyScraper.GiphyGetter

  defdelegate search(query, limit \\ 25),
    to: GiphyGetter,
    as: :query_api_and_decode_image_list_from_json_response
end
