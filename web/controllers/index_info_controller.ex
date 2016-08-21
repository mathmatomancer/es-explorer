defmodule EsExplorer.IndexInfoController do
  use EsExplorer.Web, :controller

  def index(conn, _params) do

    local_host = "localhost:9200"
    url = "http://#{local_host}/_cat/indices"
    local_response = HTTPotion.get url
    # want to parse this, and construct links to the settings page for each detected index
    list = String.split(local_response.body, "\n")
#    ul = []
#    Enum.each(list, fn(x) -> ul = ul ++ ["<li>#{x}</li>"] end)

    render conn, "index.html", list: list
  end

  def settings(conn, params) do
    name = params["index"]
    local_host = "localhost:9200"
    prod_host = "localhost:9200" # figure out how to load this from a config file--do not check in prod url!!!

    live_response = HTTPotion.get  "http://#{prod_host}/#{name}/_settings?pretty=true"

    local_response = HTTPotion.get "http://#{local_host}/#{name}/_settings?pretty=true"

    render conn, "settings.html", name: name, live: live_response.body, local: local_response.body
  end
end
