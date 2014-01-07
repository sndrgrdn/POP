class Competence < ActiveRecord::Base
  has_many :learning_goals
  has_many :european_credits
end
