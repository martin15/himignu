class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :event_image_file_name
      t.string :event_image_content_type
      t.integer :event_image_file_size
      t.datetime :event_image_updated_at
      t.integer :event_id
      t.timestamps
    end
  end
end
