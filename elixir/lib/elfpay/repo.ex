defmodule Elfpay.Repo do
  use Ecto.Repo,
    otp_app: :elfpay,
    adapter: Ecto.Adapters.Postgres
end
