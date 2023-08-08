defmodule Builder.Repo.Migrations.AddColumnsTable do
  use Ecto.Migration

  def change do
    create table(:sys_column) do
    #create table(:sys_column, primary_key: false) do
      #add :column_id, :integer
      add :table_name, :string
      add :column_name, :string
      add :ordinal_position, :integer
      add :is_nullable, :string
      add :data_type, :string
      add :table_id, references(:sys_table)
      timestamps()
    end
  end
end
