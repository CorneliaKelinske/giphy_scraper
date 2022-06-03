defmodule GiphyScraper.GiphyImage do
  @moduledoc """
  Representation of a giphy image obtained from the giphy API
  """

  @enforce_keys [:id, :url, :username, :title]
  defstruct [:id, :url, :username, :title]

  @type t :: %__MODULE__{id: String.t(), title: String.t(), url: String.t(), username: String.t()}


  @spec map_to_image_struct(map) :: [t]
  def map_to_image_struct(data) do
    Enum.map(data, fn %{"id" => id, "url" => url, "username" => username, "title" => title} ->
      %__MODULE__{id: id, url: url, username: username, title: title}
    end)
  end
end
