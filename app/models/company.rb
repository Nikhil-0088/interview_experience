class Company < ApplicationRecord
    has_many :experiences 
    validates :name, presence: true
end 