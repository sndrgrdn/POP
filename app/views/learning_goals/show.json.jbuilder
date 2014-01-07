json.id @learning_goal.id
json.name @learning_goal.name
json.is_completed @learning_goal.is_completed
json.updated_at @learning_goal.updated_at.strftime("%d-%m-%y")


json.activities @learning_goal.activity do |a|
  json.id a.id
  json.name a.name
  json.is_completed a.is_completed
end