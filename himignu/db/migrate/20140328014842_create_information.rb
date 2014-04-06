class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :name
      t.text :content
      t.string :permalink
      t.boolean :is_popular
      t.timestamps
    end
  end
end
