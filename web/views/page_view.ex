defmodule EsExplorer.PageView do
  use EsExplorer.Web, :view

  def cookies(conn, cookie_name) do
    conn.cookies[cookie_name]
  end
end
