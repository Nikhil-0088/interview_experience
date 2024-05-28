class Company < ApplicationRecord
    before_save {self.name=name.downcase}
    has_many :experiences 
    validates :name, presence: true,uniqueness:{case_sensitivity: false}
end 