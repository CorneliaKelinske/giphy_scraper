defmodule GiphyScraper.GiphyGetterTest do
  use ExUnit.Case

  alias GiphyScraper.GiphyGetter
  alias GiphyScraper.Support.{HTTPSandbox, SandboxResponses}

  @query "horse"
  @invalid_query "guinea pig"

  describe "&query_api_and_decode_json_response/2" do
    test "returns tuple with :ok and list of json_objects for valid query" do
      HTTPSandbox.set_get_responses([SandboxResponses.mock_get_giphy_response()])
      assert {:ok, [_ | _]} = GiphyGetter.query_api_and_decode_json_response(@query, [])
    end

    test "returns tuple with :ok and empty list when no results are found" do
      HTTPSandbox.set_get_responses([SandboxResponses.mock_empty_get_giphy_response()])
      assert {:ok, []} = GiphyGetter.query_api_and_decode_json_response("", [])
    end

    test "returns error tuple for invalid request" do
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
              }} = GiphyGetter.query_api_and_decode_json_response(@invalid_query, 1)
    end
  end

  describe "&query_api_and_decode_json_response/2 against live api" do
    @describetag :http
    test "returns tuple with :ok and list of json_objects for valid query" do
      assert {:ok, [_ | _]} =
               GiphyGetter.query_api_and_decode_json_response(@query, 1, sandbox?: false)
    end

    test "returns error tuple for invalid request" do
      assert {:error,
              %ErrorMessage{
                code: :bad_request,
                message: "something went wrong",
                details: %{
                  reason:
                    {:invalid_request_target,
                     "/v1/gifs/search?api_key=4zz3hAmMPYfOXbJTvGW7N4AniWFUm4SL&limit=1&q=guinea pig"}
                }
              }} =
               GiphyGetter.query_api_and_decode_json_response(@invalid_query, 1, sandbox?: false)
    end
  end
end
