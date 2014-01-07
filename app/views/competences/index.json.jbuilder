json.array! @competences do |competence|
  json.id competence.id
  json.name competence.name
  json.total_ec competence.european_credits.sum(:amount)
end