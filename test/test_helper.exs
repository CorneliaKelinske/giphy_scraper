ExUnit.configure(exclude: [:http])
GiphyScraper.Support.HTTPSandbox.start_link()
ExUnit.start()
