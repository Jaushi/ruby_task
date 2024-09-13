personal_data = [
  { national_id: "1234-5678-9012", name: "Santos", age: 19 },
  { national_id: "3456-7890-1234", name: "Reyes", age: 18 },
  { national_id: "5678-9012-3456", name: "Cruz", age: 21 },
  { national_id: "7890-1234-5678", name: "Bautista", age: 43 },
  { national_id: "9012-3456-7890", name: "Ocampo", age: 32 },
  { national_id: "2345-6789-0123", name: "Garcia", age: 54 },
  { national_id: "4567-8901-2345", name: "Mendoza", age: 52 },
  { national_id: "6789-0123-4567", name: "Torres", age: 36 },
  { national_id: "8901-2345-6789", name: "Flores", age: 48 },
  { national_id: "0123-4567-8901", name: "Ramos", age: 41 },
  { national_id: "2345-6789-0123", name: "Aquino", age: 22 },
  { national_id: "4567-8901-2345", name: "Castillo", age: 29 },
  { national_id: "6789-0123-4567", name: "Rivera", age: 25 },
  { national_id: "8901-2345-6789", name: "Gonzales", age: 37 },
  { national_id: "0123-4567-8901", name: "Dela Cruz", age: 66 },
  { national_id: "2345-6789-0123", name: "Martinez", age: 49 },
  { national_id: "4567-8901-2345", name: "Hernandez", age: 26 },
  { national_id: "6789-0123-4567", name: "Lopez", age: 17 },
  { national_id: "8901-2345-6789", name: "Fernandez", age: 51 },
  { national_id: "0123-4567-8901", name: "Diaz", age: 38 }
]

person_id = 0
personal_data.each do |person|
  person_id += 1
  puts "Person #{person_id}: #{person[:name]}, #{person[:age]}"
end
