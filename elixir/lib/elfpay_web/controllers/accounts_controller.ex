defmodule ElfpayWeb.AccountsController do
  use ElfpayWeb, :controller
  alias Elfpay.Account
  action_fallback ElfpayWeb.FallbackController
  
  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Elfpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
