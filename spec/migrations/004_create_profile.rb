class CreateProfile < Sequel::Migration
  def up
    create_table :profiles do
      primary_key :id
      foreign_key :item_id, :items, :type => Fixnum
      DateTime    :created_at
      String      :name
      String      :last_name
      String      :email
      index       :item_id
      index       [:name, :last_name]
      index       [:name, :last_name, :email], unique: true
    end

    alter_table :items do
      add_foreign_key :profile_id, :profiles, :type => Fixnum
    end
  end

  def down
    drop_table :profiles
  end
end
