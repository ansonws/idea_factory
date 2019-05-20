class Review < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates(
    :body,
    length: { minimum: 5 }
  )
end
