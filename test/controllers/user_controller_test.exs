defmodule PhoenixMazurka.UserControllerTest do
  use PhoenixMazurka.ConnCase

  test "GET /users/:user", %{conn: conn} do
    conn = get(conn, "/users/123")
    assert %{"name" => "User 123"} = json_response(conn, 200)
  end
end
