defmodule Builder.Repo.Migrations.CreateSchemas do
  use Ecto.Migration

  def change do
    create table(:schemas) do
      add :title, :string
      add :type, :string
      add :parent, :string
      add :schema, :string
      add :layout, :string
      timestamps()
    end
  end
end
