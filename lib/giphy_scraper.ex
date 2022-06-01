defmodule GiphyScraper do
  @moduledoc """
  Documentation for `GiphyScraper`.
  """
  alias GiphyScraper.GiphyGetter

  defdelegate search(query, limit \\ 25),
    to: GiphyGetter,
    as: :query_giphy_api_and_turn_json_results_into_the_nice_image_struct
end
