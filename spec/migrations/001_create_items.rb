class CreateItems < Sequel::Migration

  def up
    create_table  :items do 
      primary_key :id
      String      :name, unique: true
      Float       :price, index: true
      index       [:name, :price]
    end
  end

  def down
    drop_table    :items
  end

end
