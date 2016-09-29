defmodule PhoenixMazurka.RootControllerTest do
  use PhoenixMazurka.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert %{"account" => %{"href" => _}} = json_response(conn, 200)
  end
end
