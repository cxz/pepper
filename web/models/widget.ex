defmodule Pepper.Widget do
  use Pepper.Web, :model

  schema "widgets" do
    belongs_to :dashboard, Pepper.Dashboard
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
