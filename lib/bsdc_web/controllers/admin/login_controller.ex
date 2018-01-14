defmodule BsdcWeb.Admin.LoginController do
  use BsdcWeb, :controller

  def show(conn, _) do
   render(conn, "login.html") 
  end
end