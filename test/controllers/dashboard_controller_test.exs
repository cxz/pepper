defmodule Pepper.DashboardControllerTest do
  use Pepper.ConnCase

  alias Pepper.Dashboard
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dashboard_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    dashboard = Repo.insert! %Dashboard{}
    conn = get conn, dashboard_path(conn, :show, dashboard)
    assert json_response(conn, 200)["data"] == %{"id" => dashboard.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dashboard_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, dashboard_path(conn, :create), dashboard: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Dashboard, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dashboard_path(conn, :create), dashboard: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    dashboard = Repo.insert! %Dashboard{}
    conn = put conn, dashboard_path(conn, :update, dashboard), dashboard: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Dashboard, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dashboard = Repo.insert! %Dashboard{}
    conn = put conn, dashboard_path(conn, :update, dashboard), dashboard: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    dashboard = Repo.insert! %Dashboard{}
    conn = delete conn, dashboard_path(conn, :delete, dashboard)
    assert response(conn, 204)
    refute Repo.get(Dashboard, dashboard.id)
  end
end
