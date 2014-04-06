# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140406141436) do

  create_table "banners", :force => true do |t|
    t.string   "banner_image_file_name"
    t.string   "banner_image_content_type"
    t.integer  "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.string   "destination"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "event_images", :force => true do |t|
    t.string   "event_image_file_name"
    t.string   "event_image_content_type"
    t.integer  "event_image_file_size"
    t.datetime "event_image_updated_at"
    t.integer  "event_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "theme"
    t.text     "content"
    t.string   "year"
    t.date     "held_on"
    t.string   "permalink"
    t.string   "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_popular", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "permalink",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gallery_images", :force => true do |t|
    t.text     "note"
    t.string   "gallery_image_file_name"
    t.string   "gallery_image_content_type"
    t.integer  "gallery_image_file_size"
    t.datetime "gallery_image_updated_at"
    t.integer  "gallery_id"
    t.boolean  "is_primary"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "information", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "permalink"
    t.boolean  "is_popular"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "chinese_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "religion"
    t.text     "address"
    t.string   "city"
    t.date     "birthday"
    t.string   "birthday_place"
    t.string   "passport_number"
    t.string   "dormitory"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
