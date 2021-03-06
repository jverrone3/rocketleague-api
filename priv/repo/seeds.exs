# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RocketleaguePhoenix.Repo.insert!(%RocketleaguePhoenix.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RocketleaguePhoenix.Repo
alias RocketleaguePhoenix.Player
alias RocketleaguePhoenix.Team
alias RocketleaguePhoenix.Match

Repo.insert!(%Team{name: "Cardigans of the Goalaxy", wins: 0, loses: 0})
Repo.insert!(%Team{name: "Carship Enterprise", wins: 0, loses: 0})

Repo.insert!(%Player{username: "wrobert666", first_name: "Williamrobert", last_name: "Green", email_address: "bubba.r66@gmail.com", team_id: 1})
Repo.insert!(%Player{username: "CFM DaBeast", first_name: "Chris", last_name: "Morrison", email_address: "crimson.gent@gmail.com", team_id: 1})
Repo.insert!(%Player{username: "sleepysliders13", first_name: "Keith", last_name: "Green", email_address: "kg66z32@gmail.com", team_id: 1})
Repo.insert!(%Player{username: "CLiiCK Wasted", first_name: "John", last_name: "Verrone", email_address: "john.verrone@gmail.com", team_id: 2})
Repo.insert!(%Player{username: "whroo", first_name: "Eric", last_name: "Matlock", email_address: "ericmatlock@gmail.com", team_id: 2})

Repo.insert!(%Match{match_date: %Ecto.Date{day: 25, month: 12, year: 2016}, week_number: 1, blue_team_id: 1, orange_team_id: 2})