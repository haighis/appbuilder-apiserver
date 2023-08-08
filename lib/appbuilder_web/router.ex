defmodule AppbuilderWeb.Router do
  use AppbuilderWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AppbuilderWeb do
    pipe_through :api
    post "/setup", SetupController, :setup

    get "systemcolumns", SystemColumnController, :get_all

    # get "/containers", ContainerController, :get_all
    # get "/containers/:key", ContainerController, :get
    # post "/containers", ContainerController, :save
    # put "/containers/:key", ContainerController, :update
    # delete "/containers/:key", ContainerController, :delete

    get "/schemas", SchemaController, :get_all
    get "/schemas/:key", SchemaController, :get
    post "/schemas", SchemaController, :save
    put "/schemas/:key", SchemaController, :update
    delete "/schemas/:key", SchemaController, :delete
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:appbuilder, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
