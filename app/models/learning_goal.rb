class LearningGoal < ActiveRecord::Base
  belongs_to :competence
  has_many :activity
end
