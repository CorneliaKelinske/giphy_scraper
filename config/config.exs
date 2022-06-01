import Config

api_key = System.get_env("API_KEY")

config :giphy_scraper,
  load_from_system_env: true

config :giphy_scraper,
  api_key: api_key
