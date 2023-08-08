defmodule Appbuilder.Model.SysColumn do
  use Ecto.Schema
  use Appbuilder.Model
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:table_name, :column_name, :ordinal_position, :is_nullable, :data_type], except: [:__meta__, :__struct__]}
  #@derive {Jason.Encoder, except: [:__meta__, :__struct__]}
  @required_params ~w(table_name, column_name, ordinal_position, is_nullable, data_type)a
  schema "sys_column" do
    field :table_name, :string
    field :column_name, :string
    field :ordinal_position, :integer
    field :is_nullable, :string
    field :data_type, :string
    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
