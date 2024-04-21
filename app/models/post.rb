class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: "Title must be filled out" }
  validates :content, presence: { message: "Content must be filled out" }
end
