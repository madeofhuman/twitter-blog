class Comment < ApplicationRecord
  belongs_to :article
  validates  :commenter, presence: :true, length: { minimum: 1, maximum: 50 }
  validates  :body,      presence: :true, length: { minimum: 1, maximum: 240 }
end
