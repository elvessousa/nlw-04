
defmodule ElfpayWeb.AccountsControllerTest do
  use ElfpayWeb.ConnCase, async: true

  alias Elfpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Elves",
        password: "123456",
        nickname: "Sousa",
        email: "elf@teum.co",
        age: 35
      }

      {:ok, %User{account: %Account{id: account_id}}} = Elfpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic dXNlcjpwYXNzd29yZA==")
      {:ok, conn: conn, account_id: account_id}
    end

    test "When all params are valid, make a deposit", 
    %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response = 
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id}, 
        "message" => "Balance updated successfully."
      } = response

    end

    test "When params are invalid, throw an error", 
    %{conn: conn, account_id: account_id} do
      params = %{"value" => "teum!"}

      response = 
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
