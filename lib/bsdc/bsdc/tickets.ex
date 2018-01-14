defmodule Bsdc.Tickets do
  @moduledoc """
  This modules will handle ticketing for Big Sky Dev Con.
  """

  @spec purchase(token :: String.t) :: :ok | {:error, String.t}
  def purchase(token) do
    case Stripe.charge(token, %{"amount" => ticket_price()}) do
      {:ok, _} ->
        :ok
        
      error ->
        error
    end
  end

  defp ticket_price() do
    3500
  end
end