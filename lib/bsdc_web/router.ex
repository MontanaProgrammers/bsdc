defmodule BsdcWeb.Router do
  use BsdcWeb, :router

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

  scope "/", BsdcWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    post "/charge", PageController, :charge
  end

  scope "/admin", BsdcWeb.Admin do
    pipe_through :browser

    get "/login", LoginController, :show
  end
end
