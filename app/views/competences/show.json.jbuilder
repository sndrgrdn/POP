json.id @competence.id
json.name @competence.name
json.total_ec @competence.european_credits.sum(:amount)

json.learning_goals @competence.learning_goals do |lg|
  json.id lg.id
  json.name lg.name
  json.is_completed lg.is_completed
  json.updated_at lg.updated_at.strftime("%d-%m-%y")
end

json.european_credits @competence.european_credits do |ec|
  json.id ec.id
  json.amount ec.amount
  json.level ec.level
end
