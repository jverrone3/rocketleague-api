defmodule RocketleaguePhoenix.PlayerTest do
  use RocketleaguePhoenix.ModelCase

  alias RocketleaguePhoenix.Player
  alias RocketleaguePhoenix.Team

  @valid_attrs %{email_address: "some@content", first_name: "some content", last_name: "some content", username: "some content", team_id: 1}
  @invalid_email %{email_address: "some content", first_name: "some content", last_name: "some content", username: "some content"}
  @invalid_attrs %{}

  setup do
    Repo.insert!(%Team{id: 1, name: "Carship Enterprise", wins: 0, loses: 0})
    :ok
  end

  test "changeset with valid attributes" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Player.changeset(%Player{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid email" do
    changeset = Player.changeset(%Player{}, @invalid_email)
    refute changeset.valid?
  end

  test "invalid if email is taken" do
    %Player{} 
    |> Player.changeset(@valid_attrs) 
    |> RocketleaguePhoenix.Repo.insert!

    player2 = %Player{} |> Player.changeset(@valid_attrs)
    assert {:error, changeset} = Repo.insert(player2)
    assert changeset.errors[:email_address] == {"has already been taken", []}
  end
end
