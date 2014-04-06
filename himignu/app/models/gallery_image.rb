class GalleryImage < ActiveRecord::Base
  attr_accessor :set_primary_image
  attr_accessible :gallery_image, :gallery_id, :is_primary, :note

  belongs_to :gallery
  has_attached_file :gallery_image, :styles => { :thumb => "100x100",
                                                 :small => "200x200",
                                                 :medium => "320x320" ,
                                                 :large => "600x600" }
  validates_attachment_presence :gallery_image
  after_create :check_primary_image
  after_destroy :set_primary_image
  scope :primary, :conditions => "is_primary = 1"

  def is_primary?
    !!is_primary
  end

  def check_primary_image
    gallery = self.gallery
    return unless gallery.primary_image.nil?
    self.set_primary
    return self.save
  end

  def change_primary_image
    gallery = self.gallery
    old_primary_image = gallery.primary_image
    unless old_primary_image.nil?
      return false unless old_primary_image.unset_primary
    end
    self.set_primary
    return self.save
  end

  def set_primary_image
    gallery = self.gallery
    return unless gallery.primary_image.nil?
    new_pimary_image = gallery.gallery_images.first
    unless new_pimary_image.nil?
      new_pimary_image.update_attribute :is_primary, true
    end
  end

  def unset_primary
    self.is_primary = false
    self.save!
  end

  protected
    def set_primary
      self.is_primary = true
    end

end
