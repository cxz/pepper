defmodule Pepper.DashboardController do
  use Pepper.Web, :controller

  alias Pepper.Dashboard

  def index(conn, _params) do
    dashboards = Repo.all(from d in Dashboard, preload: [:widgets])
    render(conn, "index.json", dashboards: dashboards)
  end

  def create(conn, %{"dashboard" => dashboard_params}) do
    changeset = Dashboard.changeset(%Dashboard{}, dashboard_params)

    case Repo.insert(changeset) do
      {:ok, dashboard} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", dashboard_path(conn, :show, dashboard))
        |> render("show.json", dashboard: dashboard)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pepper.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dashboard = Repo.get!(Dashboard, id)
    render(conn, "show.json", dashboard: dashboard)
  end

  def update(conn, %{"id" => id, "dashboard" => dashboard_params}) do
    dashboard = Repo.get!(Dashboard, id)
    changeset = Dashboard.changeset(dashboard, dashboard_params)

    case Repo.update(changeset) do
      {:ok, dashboard} ->
        render(conn, "show.json", dashboard: dashboard)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pepper.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dashboard = Repo.get!(Dashboard, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dashboard)

    send_resp(conn, :no_content, "")
  end
end
