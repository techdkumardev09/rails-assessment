
json_file_path = Rails.root.join('public', 'data.json')
data = JSON.parse(File.read(json_file_path))

data.each do |person_data|
    person = Person.create(name: person_data["name"])
    person.create_detail(
      title: person_data["info"]["title"],
      age: person_data["info"]["age"],
      phone: person_data["info"]["phone"],
      email: person_data["info"]["email"]
    )
  end