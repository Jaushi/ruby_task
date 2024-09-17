class Citizen
  attr_accessor :national_id, :name, :age
  citizen_data = [
    { national_id: "1234-5678-9012", name: "Santos", age: 19, created_at: Time.now },
    { national_id: "3456-7890-1234", name: "Reyes", age: 18, created_at: Time.now },
    { national_id: "5678-9012-3456", name: "Cruz", age: 21, created_at: Time.now },
    { national_id: "7890-1234-5678", name: "Bautista", age: 43, created_at: Time.now },
    { national_id: "9012-3456-7890", name: "Ocampo", age: 32, created_at: Time.now },
    { national_id: "2345-6789-0123", name: "Garcia", age: 54, created_at: Time.now },
    { national_id: "4567-8901-2345", name: "Mendoza", age: 52, created_at: Time.now },
    { national_id: "6789-0123-4567", name: "Torres", age: 36, created_at: Time.now },
    { national_id: "8901-2345-6789", name: "Flores", age: 48, created_at: Time.now },
    { national_id: "0123-4567-8901", name: "Ramos", age: 41, created_at: Time.now },
    { national_id: "2345-6789-0124", name: "Aquino", age: 22, created_at: Time.now },
    { national_id: "4567-8901-2346", name: "Castillo", age: 29, created_at: Time.now },
    { national_id: "6789-0123-4568", name: "Rivera", age: 25, created_at: Time.now },
    { national_id: "8901-2345-6790", name: "Gonzales", age: 37, created_at: Time.now },
    { national_id: "0123-4567-8902", name: "Dela Cruz", age: 66, created_at: Time.now },
    { national_id: "2345-6789-0125", name: "Martinez", age: 49, created_at: Time.now },
    { national_id: "4567-8901-2347", name: "Hernandez", age: 26, created_at: Time.now },
    { national_id: "6789-0123-4569", name: "Lopez", age: 17, created_at: Time.now },
    { national_id: "8901-2345-6791", name: "Fernandez", age: 51, created_at: Time.now },
    { national_id: "4264-4451-5545", name: "Diaz", age: 38, created_at: Time.now }
  ]

  citizen_data.each do |person|
    new_citizen = Citizen.new
    new_citizen.national_id = person[:national_id]
    new_citizen.name = person[:name]
    new_citizen.age = person[:age]

  end
end