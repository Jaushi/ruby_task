require_relative 'citizen'

def clear_terminal
  system("clear") || system("cls")
end

def display_citizen_data
  sorted_data = Citizen.all_records.sort_by { |person| -person.created_at.to_i }
  sorted_data.first(5).each_with_index do |person, index|
    puts "Person #{index + 1}: #{person.national_id} #{person.name}, #{person.age}"
  end
end

def add
  puts "Input national id:"
  new_national_id = gets.chomp

  puts "Input name:"
  new_name = gets.chomp

  puts "Input age:"
  new_age = gets.chomp.to_i

  if Citizen.all_records.any? { |person| person.national_id == new_national_id }
    puts "Failed to add: National ID already exists."
  else
    new_citizen = Citizen.new(new_national_id, new_name, new_age, Time.now)
    new_citizen.save
    puts "User added successfully!"
    display_citizen_data
  end
end

def remove
  puts "Enter the National ID to delete the user:"
  delete_user = gets.chomp

  if Citizen.all_records.reject! { |person| person.national_id == delete_user }
    puts "Successfully deleted."
    display_citizen_data
  else
    puts "User not found."
  end
end

def search
  puts "Enter the National ID to search the user:"
  search_user = gets.chomp

  user = Citizen.all_records.detect { |person| person.national_id == search_user }

  if user
    puts "User found!"
    puts "National ID: #{user.national_id} Name: #{user.name} Age: #{user.age}"
  else
    puts "User not found."
  end
end

def edit
  puts "Enter the National ID to edit the user:"
  edit_user_id = gets.chomp
  user = Citizen.all_records.detect { |person| person.national_id == edit_user_id }

  if user
    puts "Enter 'age' to edit the age"
    puts "Enter 'name' to edit the name"
    edit_choice = gets.chomp.downcase

    case edit_choice
    when 'age'
      puts "Edit new age:"
      new_age = gets.chomp.to_i
      user.age = new_age
      puts "Updated | National ID: #{user.national_id} Name: #{user.name} Age: #{user.age}"
    when 'name'
      puts "Edit new name:"
      new_name = gets.chomp
      user.name = new_name
      puts "Updated | National ID: #{user.national_id} Name: #{user.name} Age: #{user.age}"
    else
      puts "Invalid choice. Please enter 'age' or 'name'."
    end
  else
    puts "User not found."
  end
end

def quit_program
  print "Are you sure you want to exit (y/n)? "
  exit_choice = gets.chomp.downcase
  if exit_choice == 'y'
    puts "Exiting..."
    exit
  elsif exit_choice == 'n'
    puts "Going back to the main menu."
  else
    puts "Invalid choice. Please enter 'y' or 'n'."
  end
end

choice = nil
while choice != 'e'
  clear_terminal
  display_citizen_data

  puts "Enter a letter to select:"
  puts "Add a new person in the database = 'a'"
  puts "Delete a person in the database = 'd'"
  puts "Search a person in the database = 's'"
  puts "Edit a person in the database = 'w'"
  puts "To exit = 'e'"
  print "Enter a choice: "
  choice = gets.chomp.downcase

  case choice
  when 'a'
    add
  when 'd'
    remove
  when 's'
    search
  when 'w'
    edit
  when 'e'
    quit_program
  else
    puts "Invalid choice. Please enter 'a', 'd', 's', 'w', or 'e'."
  end
end