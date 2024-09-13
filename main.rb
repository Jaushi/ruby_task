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

puts "Add a new person  in the data_base= 'a'"
puts "Delete a person in the data_base= 'd'"
puts "Enter a choice:"

choice = gets.chomp

case choice
when "a"

  puts "Do you want to add a new person to the list yes = 'y'| no = 'n':"
  add_new_person = gets.chomp

  if add_new_person == "y"
    puts "Input national id:"
    new_national_id = gets.chomp

    puts "Input name:"
    new_name = gets.chomp

    puts "Input age:"
    new_age = gets.chomp.to_i

    if personal_data.any? { |person| person[:national_id] == new_national_id }
      puts "Failed to add: National ID already exists."
    else
      puts "User added successfully!"
      personal_data << { national_id: "#{new_national_id}", name: "#{new_name}", age: "#{new_age}" }

    end
  else
    exit
  end

when "d"
  puts "Enter the National ID to delete the user:"
  delete_user = gets.chomp
  if personal_data.reject! { |person| person[:national_id] == delete_user }
    puts "Successfully deleted."
  else
    puts "User not found"
  end

else
  puts "Invalid choice."
end