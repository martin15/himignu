class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :theme
      t.text :content
      t.string :year
      t.date :held_on
      t.string :permalink
      t.string :event_id
      t.boolean :is_popular
      t.timestamps
    end
  end
end
