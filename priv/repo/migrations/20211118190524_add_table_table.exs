defmodule Builder.Repo.Migrations.AddTableTable do
  use Ecto.Migration

  def change do
    create table(:sys_table) do
      #add :table_id, :integer
      add :table_name, :string
      timestamps()
    end
  end
end