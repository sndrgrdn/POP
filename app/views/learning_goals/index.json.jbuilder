json.array! @learning_goals do |lg|
  json.id lg.id
  json.name lg.name
  json.is_completed lg.is_completed
  json.updated_at lg.updated_at.strftime("%d-%m-%y")
end