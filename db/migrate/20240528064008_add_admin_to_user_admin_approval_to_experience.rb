class AddAdminToUserAdminApprovalToExperience < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin , :boolean,default: false 
    add_column :experiences, :approved, :boolean,default: false
  end
end
