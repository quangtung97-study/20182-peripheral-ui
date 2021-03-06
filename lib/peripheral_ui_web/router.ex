defmodule PeripheralUiWeb.Router do
  use PeripheralUiWeb, :router

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

  scope "/", PeripheralUiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", PeripheralUiWeb do
    pipe_through :api

    post "/light/change/:value", LightController, :change
    post "/light/:action", LightController, :toggle
  end
end
