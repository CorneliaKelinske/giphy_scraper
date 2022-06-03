Create an elixir project using `mix new` named "GiphyScraper" and write a simple project that allows you to call `GiphyScraper.search(query)` and returns 25 results in the following format:



[
  %GiphyImage{
    id: "some_id", 
    url: "url_to_gif", 
    username: "username of creator", 
    title: "SomeGif"
  },

  %GiphyImage{
    id: "some_other_id", 
    url: "url_to_gif_2", 
    username: "username of creator", 
    title: "MyGif"
  }
]
	
I recommend using the HTTPoison module to make the requests and you can find the Giphy endpoint here. 



Note: the naming of `GiphyScraper` and `GiphyImage` are up to you to determine. 


G
Very clean code Cornelia! Great work. One area you could improve is the flow of how the struct gets called. We can do this by instead of calling the struct inside the GiphyGetter, moving up our logic so we call the GiphyGetter fetch in GiphyScraper, then turn it into a GiphyImage in GiphyScraper. This way the top level module acts as a combiner for the two submodules. 

https://dev.to/miros/mixing-clean-architecture-428c

Great work overall though!! Nice to see specs on public functions.

Cheers,