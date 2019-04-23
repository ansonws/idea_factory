class Idea < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :memberships, dependent: :destroy
  has_many :followers, through: :memberships, source: :user

  validates(:title, presence: true)

  validates(:description, length: { minimum: 8 })

  before_validation :capitalize_title

  private

  def capitalize_title
      self.title.capitalize!
  end
end
