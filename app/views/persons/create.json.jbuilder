json.extract! @person, :id, :name
json.detail do
  json.extract! @person.detail, :id, :email, :title, :age, :phone, :_destroy
end