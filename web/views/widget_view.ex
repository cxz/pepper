defmodule Pepper.WidgetView do
  use Pepper.Web, :view

  def render("index.json", %{widgets: widgets}) do
    render_many(widgets, Pepper.WidgetView, "widget.json")
  end

  def render("show.json", %{widget: widget}) do
    render_one(widget, Pepper.WidgetView, "widget.json")
  end

  def render("widget.json", %{widget: widget}) do
    %{id: widget.id}
  end
end
