defmodule ElfpayWeb.UsersController do
  use ElfpayWeb, :controller
  alias Elfpay.User
  action_fallback ElfpayWeb.FallbackController
  
  def create(conn, params) do
    with {:ok, %User{} = user} <- Elfpay.create_user(params) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
    end
  end
end
