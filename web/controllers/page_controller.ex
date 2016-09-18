defmodule EsExplorer.PageController do
  use EsExplorer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def set_cookies(conn, params) do
    local = params["page"]["local_endpoint"]
    ext = params["page"]["ext_endpoint"]

    conn |> put_resp_cookie("local_endpoint", local)
         |> put_resp_cookie("ext_endpoint", ext)
         |> render "index.html"
  end
end
