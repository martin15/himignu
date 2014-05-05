class Event < ActiveRecord::Base
  attr_accessible :name, :theme, :content, :year, :held_on,
                  :event_id, :permalink, :is_popular
  has_permalink :name, :update => true

  has_many :event_images, :dependent => :destroy
  has_many :archives, :class_name => "Event", :foreign_key => "event_id"
  belongs_to :event, :class_name => "Event", :foreign_key => "event_id"
  validates :name, :presence => true, :uniqueness => {:unless => :is_archive?, :on => :create}
  validates :held_on, :presence => {:if => :is_archive?}
  validates :theme, :presence => {:if => :is_archive?}
  validates :content, :presence => {:if => :is_archive?}

  before_save :validate_is_popular
  scope :main_events, where("event_id is NULL")
  scope :all_archives, where("event_id is not NULL")
  scope :popular_main_event, where("is_popular = true")

  def self.popular_event
    parent_popular = self.popular_main_event
    return nil if parent_popular.empty?
    return parent_popular.first.archives.sort_by(&:held_on).reverse.first
  end

  def popular_event
    childs = self.archives
    return nil if childs.empty?
    return childs.sort_by(&:held_on).reverse.first
  end

  def is_archive?
    return !self.event_id.nil?
  end

  def set_popular_event
    Event.popular_main_event.each do |event|
      event.unset_popular
    end
    self.set_popular
  end

  def validate_is_popular
    if Event.popular_main_event.empty?
      self.is_archive? ? self.event.set_popular : (self.is_popular = true)
    end
  end

  protected
    def unset_popular
      self.is_popular = false
      self.save
    end

    def set_popular
      self.is_popular = true
      self.save
    end
end
