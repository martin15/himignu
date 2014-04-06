class Information < ActiveRecord::Base
  has_permalink :name, :update => true
  attr_accessible :name, :content, :permalink, :is_popular

  validates :name, :presence => true,
                  :uniqueness => true
  validates :content, :presence => true

  before_destroy :validate_info_name
  scope :other_informations, where("name NOT IN ('About Us', 'PPIT', 'Short PPIT')")

  def fix_information?
    return true if ["About Us", "PPIT", "Short PPIT"].include?(name)
    return false
  end

  def validate_info_name
    !self.fix_information?
  end
end
