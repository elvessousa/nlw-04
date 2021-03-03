defmodule Elfpay do
  alias Elfpay.Users.Create, as: UserCreate 
  defdelegate create_user(params), to: UserCreate, as: :call
end
