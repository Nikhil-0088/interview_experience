class Experience < ApplicationRecord
    belongs_to :user
    belongs_to :company 
    has_many :upvotes, dependent: :destroy 
    has_many :comments, dependent: :destroy 
    has_many :upvoted_by_users, through: :upvotes,source: :user
    validates :role, inclusion: { in: %w[Internship Placement] }
    validates :OnlineTest, presence: true
    validates :TechRound1, presence: true
    validates :TechRound2, presence: true
    validates :HrRound, presence: true
    validates :Preparations, presence: true
end