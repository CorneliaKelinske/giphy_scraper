defmodule GiphyScraper.FinchHelpersTest do
  use ExUnit.Case

  alias GiphyScraper.FinchHelpers

  @url "https://api.giphy.com/v1/gifs/search"
  @params %{api_key: "ABC", q: "dog", limit: 25}

  describe "&build_query/2" do
    test "returns a FinchRequestStruct" do
      assert %Finch.Request{
               scheme: :https,
               host: "api.giphy.com",
               port: 443,
               method: "GET",
               path: "/v1/gifs/search",
               headers: [],
               body: nil,
               query: "api_key=ABC&limit=25&q=dog",
               unix_socket: nil,
               private: %{}
             } = FinchHelpers.build_query(@params, @url)
    end
  end
end
