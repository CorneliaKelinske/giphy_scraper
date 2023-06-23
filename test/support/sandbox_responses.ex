defmodule GiphyScraper.Support.SandboxResponses do
  @moduledoc false
  @url "https://api.giphy.com/v1/gifs/search"
  @giph %{
    "id" => "c76IJLufpNwSULPk77",
    "url" => "https://giphy.com/gifs/LINEFRIENDS-brown-line-friends-minini-c76IJLufpNwSULPk77",
    "username" => "LINEFRIENDS",
    "title" => "Happy Love You GIF by LINE FRIENDS"
  }

  @error %ErrorMessage{
    code: :bad_request,
    message: "something went wrong",
    details: %{
      reason:
        {:invalid_request_target,
         "/v1/gifs/search?api_key=4zz3hAmMPYfOXbJTvGW7N4AniWFUm4SL&limit=1&q=guinea pig"}
    }
  }

  def giphy_url do
    @url
  end

  def giphy_response do
    {:ok, [@giph]}
  end

  def empty_giphy_response do
    {:ok, []}
  end

  def mock_get_giphy_response do
    {giphy_url(), fn -> giphy_response() end}
  end

  def mock_empty_get_giphy_response do
    {giphy_url(), fn -> empty_giphy_response() end}
  end

  def error_response do
    {:error, @error}
  end

  def mock_error_response do
    {giphy_url(), fn -> error_response() end}
  end
end
