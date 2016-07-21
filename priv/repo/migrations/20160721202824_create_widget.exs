defmodule Pepper.Repo.Migrations.CreateWidget do
  use Ecto.Migration

  def change do
    create table(:widgets) do
      add :dashboard_id, references(:widgets)
      timestamps()
    end

  end
end
