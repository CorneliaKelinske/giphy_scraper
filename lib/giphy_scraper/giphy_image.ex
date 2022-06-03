defmodule GiphyScraper.GiphyImage do
  @moduledoc """
  Representation of a giphy image obtained from the giphy API
  """

  @enforce_keys [:id, :url, :username, :title]
  defstruct [:id, :url, :username, :title]

  @type t :: %__MODULE__{id: String.t(), title: String.t(), url: String.t(), username: String.t()}

  @spec new(map) :: t()
  def new(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
    %__MODULE__{id: id, url: url, username: username, title: title}
  end
end
