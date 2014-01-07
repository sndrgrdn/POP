json.array! @activities do |a|
  json.id a.id
  json.name a.name
  json.is_completed a.is_completed
end