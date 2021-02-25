defmodule ElfpayWeb.WelcomeController do
  use ElfpayWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to the Elfpay API")
  end
end
