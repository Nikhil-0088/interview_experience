class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :role, default: "Placement"
      t.text :OnlineTest
      t.text :TechRound1
      t.text :TechRound2
      t.text :HrRound
      t.text :Preparations
      t.timestamps
    end
  end
end
