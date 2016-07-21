defmodule Pepper.DashboardView do
  use Pepper.Web, :view

  def render("index.json", %{dashboards: dashboards}) do
    render_many(dashboards, Pepper.DashboardView, "dashboard.json")
  end

  def render("show.json", %{dashboard: dashboard}) do
    render_one(dashboard, Pepper.DashboardView, "dashboard.json")
  end

  def render("dashboard.json", %{dashboard: dashboard}) do
    %{id: dashboard.id, name: dashboard.name, widgets: Pepper.WidgetView.render("index.json", widgets: dashboard.widgets)}
  end
end
