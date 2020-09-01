class AddSolutionTextToProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :solution_text, :text
  end
end
