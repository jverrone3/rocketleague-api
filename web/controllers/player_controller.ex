defmodule RocketleaguePhoenix.PlayerController do
  use RocketleaguePhoenix.Web, :controller

  alias RocketleaguePhoenix.Player
  
  def index(conn, _params) do
    players = Repo.all(Player) |> Repo.preload([:team])
    render(conn, "index.json-api", data: players)
  end

  def create(conn, %{"data" => data}) do
    changeset = Player.changeset(%Player{}, create_params(data))

    case Repo.insert(changeset) do
      {:ok, player} ->
        player = Repo.preload(player, [:team])
        conn
        |> put_status(:created)
        |> put_resp_header("location", player_path(conn, :show, player))
        |> render("show.json-api", data: player)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RocketleaguePhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  defp create_params(data) do
    data
      |> JaSerializer.Params.to_attributes
      |> Map.take(["username", "first_name", "last_name", "email_address", "team_id"])
  end

  def show(conn, %{"id" => id}) do
    player = Repo.get!(Player, id) |> Repo.preload([:team])
    render(conn, "show.json-api", data: player)
  end

  def update(conn, %{"id" => id, "data" => data}) do
    player = Repo.get!(Player, id) |> Repo.preload([:team])
    changeset = Player.changeset(player, create_params(data))

    case Repo.update(changeset) do
      {:ok, player} ->
        render(conn, "show.json-api", data: player)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(RocketleaguePhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    player = Repo.get!(Player, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(player)

    send_resp(conn, :no_content, "")
  end
end
