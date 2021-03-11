defmodule ElfpayWeb.UsersViewTest do
  use ElfpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Elfpay.{Account, User}
  alias ElfpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Elves",
      password: "123456",
      nickname: "Sousa",
      email: "elf@teum.co",
      age: 35
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = 
      Elfpay.create_user(params)
    
    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created", 
      user: %{
        account: %{
          balance: Decimal.new("0.00"), 
          id: account_id
        }, 
        id: user_id, 
        name: "Elves", 
        nickname: "Sousa"
      }
    }

    assert expected_response == response
  end
end
