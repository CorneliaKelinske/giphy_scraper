defmodule GiphyScraper.GiphyImageTest do
  use ExUnit.Case

  alias GiphyScraper.GiphyImage

  @params %{
    "id" => "c76IJLufpNwSULPk77",
    "url" => "https://giphy.com/gifs/LINEFRIENDS-brown-line-friends-minini-c76IJLufpNwSULPk77",
    "username" => "LINEFRIENDS",
    "title" => "Happy Love You GIF by LINE FRIENDS",
    "random_param" => "random_param"
  }

  describe "&new/1" do
    test "turns provided map into a GiphyImage struct" do
      assert %GiphyScraper.GiphyImage{
               id: "c76IJLufpNwSULPk77",
               url:
                 "https://giphy.com/gifs/LINEFRIENDS-brown-line-friends-minini-c76IJLufpNwSULPk77",
               username: "LINEFRIENDS",
               title: "Happy Love You GIF by LINE FRIENDS"
             } = GiphyImage.new(@params)
    end
  end
end
