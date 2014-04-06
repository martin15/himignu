class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :banner_image_file_name
      t.string :banner_image_content_type
      t.integer :banner_image_file_size
      t.datetime :banner_image_updated_at
      t.string :destination
      t.timestamps
    end
  end
end
