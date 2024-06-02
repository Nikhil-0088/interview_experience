class User < ApplicationRecord
    before_save {self.email=email.downcase}
    has_many :experiences, dependent: :destroy
    has_many :upvotes, dependent: :destroy
    has_many :upvoted_experiences,through: :upvotes,source: :experience  
    has_many :subscribes, dependent: :destroy
    has_many :subscribed_companies,through: :subscribes,source: :company
    has_many :comments, dependent: :destroy
    has_one_attached :profile_picture
    validates :name ,presence: true 
    validates :email, presence: true, uniqueness:{case_sensitivity: false},length: { maximum:105}
    has_secure_password
end 