class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.numeric :phone

      t.timestamps
    end
  end
end
