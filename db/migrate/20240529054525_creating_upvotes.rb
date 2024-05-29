class CreatingUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.integer :user_id 
      t.integer :experience_id
    
    end
  end
end
