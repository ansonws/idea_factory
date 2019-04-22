class Idea < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates(:title, presence: true)

  validates(:description, length: { minimum: 8 })

  before_validation :capitalize_title

  private

  def capitalize_title
      self.title.capitalize!
  end
end
