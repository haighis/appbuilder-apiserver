# # Boundary Layer
# # Server boundary layer is a GenServer that has state and allows message passing using OTP GenServer.
# # The boundary layer is a user friendly API that a developer can consume in their application.
# #
# # Usage
# # GenServer.call(:schema_gen_server,{:get_all})
# # GenServer.cast(:schema_gen_server,{:save, "test title", "DATASOURCE", %{:a => 1, 2 => :b}, %{:a => 1, 2 => :b} })

# defmodule Schema.Server do
#     use GenServer
#     # Import Functional core libary that has our Lrucache Business Logic
#     alias Schema.Core
#     # Client API
#     def start_link(opts) do
#         name = opts[:name]
#         GenServer.start_link(__MODULE__, [], name: name)
#     end

#     def start_link() do
#         GenServer.start_link(__MODULE__, [])
#     end

#     def init(init_arg) do
#       {:ok, init_arg}
#     end

#     def state(pid) do
#         GenServer.call(pid, :state)
#     end

#     # Server (callbacks)
#     def handle_call({:get_all}, _from, state) do
#         # Call functional core library
#         results = Core.get_all
#         {:reply, results, state}
#     end

#     def handle_cast({:update, id, title, type, schema, uiSchema}, state) do
#         # Call functional core library
#         Core.update(id, title, type, schema, uiSchema)
#         {:noreply, state}
#     end

#     def handle_cast({:save, title, type, schema, uiSchema, container}, state) do
#         # Call functional core library
#         Core.save(title, type, schema, uiSchema, container)
#         {:noreply, state}
#     end

#     def handle_cast({:delete, id}, state) do
#         # Call functional core library
#         Core.delete_by_id(id)
#         {:noreply, state}
#     end

#     def terminate(_reason, state) do
#         :ok
#     end
# end
