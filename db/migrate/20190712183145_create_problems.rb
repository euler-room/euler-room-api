class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :title
      t.string :solution
      t.string :solution_type
      t.text   :description
      t.timestamps
    end
  end
end
