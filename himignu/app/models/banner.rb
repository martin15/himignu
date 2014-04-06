class Banner < ActiveRecord::Base
  attr_accessible :banner_image, :destination

  has_attached_file :banner_image, :styles => { :medium => "320x320" ,
                                                :large => "800x800" }
  validates_attachment_presence :banner_image

  def uri?
    uri = URI.parse(self.destination)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
