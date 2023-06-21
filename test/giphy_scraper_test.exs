defmodule GiphyScraperTest do
  use ExUnit.Case

  alias GiphyScraper.GiphyImage

  @search "heart"
  @invalid_search "guinea pig"

  @moduletag :http
  describe "&search/2" do
    test "returns tuple with :ok and a list of GiphyImage structs for valid requests" do
      assert {:ok, [%GiphyImage{} | _]} = GiphyScraper.search(@search)
    end
  end

  test "returns tuple with :ok and empty list if no results are found" do
    assert {:ok, []} = GiphyScraper.search("")
  end

  test "returns error tuple for invalid search" do
    assert {:error,
            "{:error, %Mint.HTTPError{reason: {:invalid_request_target, \"/v1/gifs/search?api_key=4zz3hAmMPYfOXbJTvGW7N4AniWFUm4SL&limit=25&q=guinea pig\"}, module: Mint.HTTP1}}"} =
             GiphyScraper.search(@invalid_search)
  end
end
