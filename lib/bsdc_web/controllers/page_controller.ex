defmodule BsdcWeb.PageController do
  use BsdcWeb, :controller

  alias Bsdc.Tickets

  def index(conn, _params) do
    render(conn, "index.html", action: "/charge")
  end

  def charge(conn, %{"token" => token}) do
    case Tickets.purchase(token) do
      {:ok, _} ->
        render(conn, "payment_succeeded.html")
      
      {:error, msg} ->
        conn
        |> put_flash(:error, "Payment failed. #{msg}")
        |> render("index.html", action: "/charge")
    end
  end
end
