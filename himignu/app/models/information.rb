class Information < ActiveRecord::Base
  has_permalink :name, :update => true
  attr_accessible :name, :content, :permalink, :is_popular

  validates :name, :presence => true,
                  :uniqueness => true
  validates :content, :presence => true

  before_destroy :validate_info_name
  scope :other_informations, where("name NOT IN ('About Us', 'PPIT', 'Short PPIT', 'Himignu',
                                                 'Guangxi Normal University', 'Guilin')")

  def fix_information?
    return true if ["Himignu", "Guangxi Normal University", "Guilin", "PPIT", "Short PPIT"].include?(name)
    return false
  end

  def about_us?
    ["himignu", "guangxi-normal-university", "guilin"].include?(permalink)
  end

  def validate_info_name
    !self.fix_information?
  end
end
