defmodule ExBankingWeb.Router do
  use ExBankingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExBankingWeb do
    pipe_through :api
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:ex_banking, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).

    scope "/dev" do
    end
  end
end
