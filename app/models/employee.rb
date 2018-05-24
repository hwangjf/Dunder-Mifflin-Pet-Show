class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, uniqueness: true
  validates :title, uniqueness: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%")
  end

end
