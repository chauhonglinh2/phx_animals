defmodule PhxAnimalsWeb.Router do
  use PhxAnimalsWeb, :router

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

  scope "/", PhxAnimalsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/dogs", DogController
    resources "/cats", CatController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxAnimalsWeb do
  #   pipe_through :api
  # end
end
