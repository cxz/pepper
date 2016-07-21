defmodule Pepper.WidgetTest do
  use Pepper.ModelCase

  alias Pepper.Widget

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Widget.changeset(%Widget{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Widget.changeset(%Widget{}, @invalid_attrs)
    refute changeset.valid?
  end
end
