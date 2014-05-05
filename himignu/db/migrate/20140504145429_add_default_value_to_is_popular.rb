class AddDefaultValueToIsPopular < ActiveRecord::Migration
  def up
      change_column :events, :is_popular, :boolean, :default => false
  end

  def down
      change_column :events, :is_popular, :boolean, :default => nil
  end
end
