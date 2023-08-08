# Functional Core
# A Schema libary that is developed as a functional core.
# The functional core is library implementation.
# The functional core should work on data that’s validated and safe. It should be predictable, so it avoids side effects.
# A functional core is means to easily reason about the application core business logic that is the same pattern
# created by James Edward Gray and Bruce A. Tate found in the book "Designing Elixir Systems with OTP".
#
# Design
# The Schema uses
# - Ecto Adapter Repository pattern
# Usage
# Schema.Core.get_all
# Schema.Core.save("Page","PAGE","someschema","uischema")
# Schema.Core.update(1,"Page","PAGE","someschema","uischema")
# Schema.Core.delete_by_id(1)
# Schema.Core.get_by_id(1)
defmodule Core.Schema do
    import Ecto.Query, only: [from: 2]
    # Handle Put - Updates (or Inserts the value if it does not exist in the cache)
    def save(title, type, parent, schema, layout) do
        {result, setting} = Appbuilder.Repo.insert(%Appbuilder.Model.Schema{title: title, type: type, parent: parent, schema: schema, layout: layout})
        result
    end

    def update(id, title, type) do
        setting = Appbuilder.Repo.get!(Appbuilder.Model.Schema, id)
        setting = Ecto.Changeset.change setting, title: title, type: type
        case Appbuilder.Repo.update setting do
        {:ok, struct}       -> IO.puts "i updated " # Updated with success
        {:error, changeset} -> # Something went wrong
        end
    end

    def get_by_id(id) do
        Appbuilder.Repo.get(Appbuilder.Model.Schema,id)
    end


    def get_all() do
        query = from(s in Appbuilder.Model.Schema, order_by: s.id)
        IO.puts "john and ben"
        Appbuilder.Repo.all(query)
        #Builder.Repo.all(Builder.Model.Schema)
    end

    def delete_all() do
        qiuery = from(s in Appbuilder.Model.Schema, where: s.id > 0)
        Appbuilder.Repo.delete_all(qiuery)
    end

    def delete_by_id(id) do
        setting = Appbuilder.Repo.get!(Builder.Model.Schema,id)
        case Appbuilder.Repo.delete setting do
        {:ok, struct}       -> :ok
        {:error, changeset} -> # Something went wrong
        end
    end
end
