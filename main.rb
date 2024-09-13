personal_data = [
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

def display_personal_data(personal_data)
  sorted_data = personal_data.sort_by { |person| -person[:created_at].to_i }
  sorted_data.each_with_index do |person, index|
    puts "Person #{index + 1}: #{person[:national_id]} #{person[:name]}, #{person[:age]}"
  end
end

continue = true

while continue
  display_personal_data(personal_data)

  puts "Add a new person in the database = 'a'"
  puts "Delete a person in the database = 'd'"
  puts "To exit = 'e'"
  puts "Enter a choice:"

  choice = gets.chomp

  case choice
  when "a"
    puts "Do you want to add a new person to the list? yes = 'y' | no = 'n':"
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
        personal_data << { national_id: new_national_id, name: new_name, age: new_age, created_at: Time.now }
        puts "User added successfully!"
        display_personal_data(personal_data)
      end
    else
      next
    end
  when "d"
    puts "Enter the National ID to delete the user:"
    delete_user = gets.chomp

    if personal_data.reject! { |person| person[:national_id] == delete_user }
      puts "Successfully deleted."
      display_personal_data(personal_data)
    else
      puts "User not found."
    end

  when "e"
    puts "Are you sure you want to exit (y/n)?"
    exit_choice = gets.chomp
    if exit_choice == "y"
      puts "Exiting..."
      break
    else 
      puts "Going back to the main."
      next
    end
  else
    puts "Invalid choice."
  end
end
