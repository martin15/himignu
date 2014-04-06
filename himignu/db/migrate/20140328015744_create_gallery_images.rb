class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.text :note
      t.string :gallery_image_file_name
      t.string :gallery_image_content_type
      t.integer :gallery_image_file_size
      t.datetime :gallery_image_updated_at
      t.integer :gallery_id
      t.boolean :is_primary
      t.timestamps
    end
  end
end
