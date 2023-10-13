defmodule AppbuilderWeb.SchemaController do
  use AppbuilderWeb, :controller
  #action_fallback MngoAppBuilderWeb.FallbackController
  def get_all(conn,_key_params) do
    results = Core.Schema.get_all #GenServer.call(:schema_gen_server,{:get_all})
    json conn |> put_status(:ok), results
  end

  def get(conn,%{"key" => key} = params) do
    result = Core.Schema.get_by_id key
    IO.puts "get " <> key
    json conn |> put_status(:ok), result
  end

  def update(conn,
  %{
    "key" => key,
    "title" => title,
    "type" => type,
    "parent" => parent,
    "schema" => schema,
    "layout" => layout
  } = params) do
    # id, title, type, parent, schema, layout
    Core.Schema.update key,title,type,parent,schema,layout
    #GenServer.cast(:schema_gen_server,{:update,key,title,type})
    send_resp(conn, :no_content, "")
  end

  def save(conn,
  %{
    "title" => title,
    "type" => type,
    "parent" => parent,
    "schema" => schema,
    "layout" => layout
  } = params) do
    #tenant = get_req_header(conn, "Tenant")
    #IO.puts "tenant " <> tenant
    IO.puts "layout " <> layout
    #GenServer.cast(:schema_gen_server,{:save,title,type,schema,uischema,container})
    Core.Schema.save title,type,parent,schema,layout
    json conn |> put_status(:created), params
  end

  def delete(conn,%{"key" => key_params}) do
    #GenServer.cast(:schema_gen_server,{:delete,key_params})
    Core.Schema.delete_by_id key_params
    send_resp(conn, :no_content, "")
  end
end
