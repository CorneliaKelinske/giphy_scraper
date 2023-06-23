defmodule GiphyScraperTest do
  use ExUnit.Case

  alias GiphyScraper.GiphyImage
  alias GiphyScraper.Support.{HTTPSandbox, SandboxResponses}

  @search "heart"
  @invalid_search "guinea pig"

  describe "&search/2" do
    test "returns tuple with :ok and a list of GiphyImage structs for valid requests" do
      HTTPSandbox.set_get_responses([SandboxResponses.mock_get_giphy_response()])
      assert {:ok, [%GiphyImage{} | _]} = GiphyScraper.search(@search)
    end
  end

  test "returns tuple with :ok and empty list if no results are found" do
    HTTPSandbox.set_get_responses([SandboxResponses.mock_empty_get_giphy_response()])
    assert {:ok, []} = GiphyScraper.search("")
  end

  test "returns error tuple for invalid search" do
    HTTPSandbox.set_get_responses([SandboxResponses.mock_error_response()])

    assert {:error,
            %ErrorMessage{
              code: :bad_request,
              message: "something went wrong",
              details: %{
                reason:
                  {:invalid_request_target,
                   "/v1/gifs/search?api_key=4zz3hAmMPYfOXbJTvGW7N4AniWFUm4SL&limit=1&q=guinea pig"}
              }
            }} = GiphyScraper.search(@invalid_search)
  end
end
