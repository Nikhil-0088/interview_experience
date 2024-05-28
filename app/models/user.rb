class User < ApplicationRecord
    before_save {self.email=email.downcase}
    has_many :experiences, dependent: :destroy
    validates :name ,presence: true 
    validates :email, presence: true, uniqueness:{case_sensitivity: false},length: { maximum:105}
    has_secure_password
end 