# GiphyScraper
[![Dialyzer](https://github.com/corneliakelinske/giphy_scraper/actions/workflows/dialyzer.yml/badge.svg)](https://github.com/corneliakelinske/giphy_scraper/actions/workflows/dialyzer.yml)
[![Credo](https://github.com/corneliakelinske/giphy_scraper/actions/workflows/credo.yml/badge.svg)](https://github.com/corneliakelinske/giphy_scraper/actions/workflows/credo.yml)
[![Build Status](https://github.com/corneliakelinske/giphy_scraper/actions/workflows/test.yml/badge.svg)](https://github.com/corneliakelinske/giphy_scraper/actions/workflows/test.yml)

##  How to run this GiphyScraper

Install direnv

```
sudo apt install direnv
```
(on Ubuntu Linux)

Create an .envrc file in the root of your project and put in your api key:

```
echo export API_KEY="XXXXXXXXX" > .envrc
```

Allow direnv

```
direnv allow
```

Reload the terminal and run the project

```
iex -S mix
```
