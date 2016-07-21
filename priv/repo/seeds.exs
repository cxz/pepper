# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pepper.Repo.insert!(%Pepper.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pepper.Repo
alias Pepper.Dashboard
alias Pepper.Widget

d1 = Repo.insert!(%Dashboard{name: "abc"})

w1 = Ecto.build_assoc(d1, :widgets, %{})
Repo.insert!(w1)

w2 = Ecto.build_assoc(d1, :widgets, %{})
Repo.insert!(w2)

w3 = Ecto.build_assoc(d1, :widgets, %{})
Repo.insert!(w3)

