class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :chinese_name
      t.string :phone_number
      t.string :email
      t.string :religion
      t.text :address
      t.string :city
      t.date   :birthday
      t.string :birthday_place
      t.string :passport_number
      t.string :dormitory
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end
end
