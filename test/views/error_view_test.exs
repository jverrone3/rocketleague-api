defmodule RocketleaguePhoenix.ErrorViewTest do
  use RocketleaguePhoenix.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(RocketleaguePhoenix.ErrorView, "404.json", []) ==
           %{errors: [%{code: 404, title: "Page not found"}]}
  end

  test "render 500.json" do
    assert render(RocketleaguePhoenix.ErrorView, "500.json", []) ==
           %{errors: [%{code: 500, title: "Internal Server Error"}]}
  end

  test "render any other" do
    assert render(RocketleaguePhoenix.ErrorView, "505.json", []) ==
           %{errors: [%{code: 500, title: "Internal Server Error"}]}
  end
end
