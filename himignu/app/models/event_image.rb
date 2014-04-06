class EventImage < ActiveRecord::Base
  attr_accessible :event_image, :event_id, :is_primary, :note

  belongs_to :event
  has_attached_file :event_image, :styles => { :thumb => "100x100",
                                               :small => "200x200",
                                               :medium => "320x320" ,
                                               :large => "600x600" }
  validates_attachment_presence :event_image
end
