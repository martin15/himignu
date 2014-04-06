class Gallery < ActiveRecord::Base
  attr_accessible :name, :permalink
  has_permalink :name, :update => true
  
  has_many :gallery_images, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true

  def show_primary_image
    image = gallery_images.primary.first
    return Gallery.default_image if image.nil?
    return image.gallery_image.url(:medium)
  end

  def self.default_image
    "undefined.jpg"
  end

  def primary_image
    gallery_images.primary.first
  end
end
