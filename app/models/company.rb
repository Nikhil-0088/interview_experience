class Company < ApplicationRecord
    before_save {self.name=name.downcase}
    has_many :experiences 
    has_many :subscribes, dependent: :destroy
    has_many :subscribed_users,through: :subscribes,source: :user
    validates :name, presence: true,uniqueness:{case_sensitivity: false}
end 