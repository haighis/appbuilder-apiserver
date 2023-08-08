defmodule Appbuilder.Model.Schema do
  use Ecto.Schema
  use Appbuilder.Model
  import Ecto.Changeset
  @derive {Jason.Encoder, except: [:__meta__, :__struct__]}
  @required_params ~w(title type schema)a
  @optional_params ~w(uischema)a
  schema "schemas" do
    field :title, :string
    field :type, :string
    field :parent, :string
    field :schema, :string
    field :layout, :string
    #belongs_to :container, Builder.Model.Container
    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    #|> foreign_key_constraint(:container_id)
  end

  #   def changeset(comment, attrs) do
  #   comment
  #   |> cast(attrs, [:body, :post_id, :user_id])
  #   |> validate_required([:body, :post_id, :user_id])
  #   |> foreign_key_constraint(:post_id)
  #   |> foreign_key_constraint(:user_id)
  # end
end
