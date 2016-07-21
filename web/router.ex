defmodule Pepper.Router do
  use Pepper.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Pepper do
    pipe_through :api
    resources "/dashboards", DashboardController, except: [:new, :edit]
    resources "/widgets/", WidgetController, except: [:new, :edit]
  end
end
