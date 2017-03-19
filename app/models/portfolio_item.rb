class PortfolioItem < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  #scope that selects portfolio items with a subtitle of "Angular" (method way)
  def self.angular
    where(subtitle: "Angular")
  end

  #scope that selects portfolio items with a subtitle of "Ruby on Rails" (lambda way)
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://placehold.it/600x400"
    self.thumb_image ||= "https://placehold.it/350x200"
  end
end

