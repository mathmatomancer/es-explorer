defmodule EsExplorer.Router do
  use EsExplorer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EsExplorer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/index_info", IndexInfoController, :index
    get "/index_settings", IndexInfoController, :settings
  end

  # Other scopes may use custom stacks.
  # scope "/api", EsExplorer do
  #   pipe_through :api
  # end
end
