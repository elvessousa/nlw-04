defmodule ElfpayWeb.AccountsController do
  use ElfpayWeb, :controller

  alias Elfpay.Account
  alias Elfpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback ElfpayWeb.FallbackController
  
  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Elfpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
  
  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Elfpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Elfpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
