class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :uid, :null => false, :unique => true

      t.timestamps
    end

    add_index :users, :uid
  end
end
