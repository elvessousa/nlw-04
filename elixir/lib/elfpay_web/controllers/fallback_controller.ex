defmodule ElfpayWeb.FallbackController do
  use ElfpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ElfpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
 end

