defmodule  Elfpay.Users.Create do
  alias Elfpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
  
end
