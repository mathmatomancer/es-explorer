defmodule EsExplorer.SearchController do
  use EsExplorer.Web, :controller

  def lite(conn, _params) do
    # form to create search to submit, can only specify index and simple query
    render conn, "lite.html", data: "", index: "", query: ""
  end

  def run_search(conn, params) do
    # run the search and render the results
    search = params["search"]
    index = search["index"]
    query = search["query"]

    local_host = "localhost:9200"

    local_response = HTTPotion.get "http://#{local_host}#{index}/_search?q=#{URI.encode(query)}"
#    local_response = HTTPotion.get "http://localhost:9200/_search?q=register"

    render conn, "lite.html", data: local_response.body, index: index, query: query
  end
end
