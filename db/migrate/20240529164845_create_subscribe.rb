class CreateSubscribe < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribes do |t|
      t.integer :user_id 
      t.integer :company_id
    end
  end
end
