class AddAdminApprovedToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :approve, :boolean,default: true
  end
end
