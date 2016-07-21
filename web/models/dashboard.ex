defmodule Pepper.Dashboard do
  use Pepper.Web, :model

  schema "dashboards" do
    field :name
    has_many :widgets, Pepper.Widget
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
