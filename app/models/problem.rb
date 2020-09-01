class Problem < ApplicationRecord
  validates_presence_of   :title, :solution, :solution_type, :description
  validates_uniqueness_of :title
end
