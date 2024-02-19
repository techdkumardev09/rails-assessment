json.id @person.id
json.name @person.name

json.detail do
  json.id @person.detail.id
  json.email @person.detail.email
  json.title @person.detail.title
  json.age @person.detail.age
  json.phone @person.detail.phone
  json._destroy @person.detail._destroy
end
