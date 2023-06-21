defmodule GiphyScraper.GiphyGetterTest do
  use ExUnit.Case

  alias GiphyScraper.GiphyGetter

  @query "horse"
  @invalid_query "guinea pig"

  @moduletag :http
  describe "&query_api_and_decode_json_response/2" do
    test "returns tuple with :ok and list of json_objects for valid query" do
      assert {:ok, [_ | _]} = GiphyGetter.query_api_and_decode_json_response(@query)
    end

    test "returns tuple with :ok and empty list when no results are found" do
      assert {:ok, []} = GiphyGetter.query_api_and_decode_json_response("")
    end

    test "returns error tuple for invalid request" do
      assert {:error,
              "{:error, %Mint.HTTPError{reason: {:invalid_request_target, \"/v1/gifs/search?api_key=4zz3hAmMPYfOXbJTvGW7N4AniWFUm4SL&limit=25&q=guinea pig\"}, module: Mint.HTTP1}}"} =
               GiphyGetter.query_api_and_decode_json_response(@invalid_query)
    end
  end
end
