class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :experience
    validates :content,presence: true
end 