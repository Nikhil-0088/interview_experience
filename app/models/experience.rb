class Experience < ApplicationRecord
    belongs_to :user
    belongs_to :company 
    validates :role, inclusion: { in: %w[Internship Placement] }
    validates :OnlineTest, presence: true
    validates :TechRound1, presence: true
    validates :TechRound2, presence: true
    validates :HrRound, presence: true
end