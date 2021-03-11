
defmodule  Elfpay.Users.CreateTest do
  use Elfpay.DataCase, async: true

  alias Elfpay.User
  alias Elfpay.Users.Create

  describe "call/1" do
    test "When all params are valid, returns a user" do
      params = %{
        name: "Elves",
        password: "123456",
        nickname: "Sousa",
        email: "elf@teum.co",
        age: 35
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Elves", age: 35, id: ^user_id} = user
    end
  
    test "When some params are invalid, returns an error" do
      params = %{
        name: "Elves",
        nickname: "Sousa",
        email: "elf@teum.co",
        age: 13
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
