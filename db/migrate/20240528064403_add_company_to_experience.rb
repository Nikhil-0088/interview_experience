class AddCompanyToExperience < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :company_id, :int
  end
end
