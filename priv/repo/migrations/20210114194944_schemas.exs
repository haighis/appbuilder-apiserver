defmodule Builder.Repo.Migrations.CreateSchemas do
  use Ecto.Migration

  def change do
    create table(:schemas) do
      add :title, :string
      add :type, :string
      add :parent, :string
      add :schema, :text
      add :layout, :text
      timestamps()
    end
  end
end
