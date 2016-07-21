defmodule Pepper.DashboardTest do
  use Pepper.ModelCase

  alias Pepper.Dashboard

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dashboard.changeset(%Dashboard{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dashboard.changeset(%Dashboard{}, @invalid_attrs)
    refute changeset.valid?
  end
end
