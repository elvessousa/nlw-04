defmodule Elfpay do
  alias Elfpay.Users.Create, as: UserCreate 
  alias Elfpay.Accounts.Deposit
  
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
end
