class Citizen
  attr_accessor :national_id, :name, :age, :created_at
  @@records = []

  def initialize(national_id, name, age, created_at = Time.now)
    @national_id = national_id
    @name = name
    @age = age
    @created_at = created_at
  end

  def save
    @@records << self
  end

  def self.all_records
    @@records
  end

  def self.first_record
    @@records.first
  end

  def self.last_record
    @@records.last
  end

  def display_record
    puts "National ID: #{@national_id}, Name: #{@name}, Age: #{@age}"
  end

  def self.find_by_national_id(national_id)
    @@records.detect { |person| person.national_id == national_id }
  end

  def update_record(name: nil, age: nil)
    @name = name if name
    @age = age if age
  end

  def self.update_record(national_id, name: nil, age: nil)
    citizen = find_by_national_id(national_id)
    if citizen
      citizen.update_record(name: name, age: age)
      puts "Record updated successfully!"
    else
      puts "Citizen with National ID #{national_id} not found."
    end
  end

  def destroy
    @@records.delete(self)
  end

  def self.destroy_all
    @@records.clear
  end

  def self.count
    @@records.size
  end
end

citizen_data = [
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
  { national_id: "2345-6789-0124", name: "Aquino", age: 22 },
  { national_id: "4567-8901-2346", name: "Castillo", age: 29 },
  { national_id: "6789-0123-4568", name: "Rivera", age: 25 },
  { national_id: "8901-2345-6790", name: "Gonzales", age: 37 },
  { national_id: "0123-4567-8902", name: "Dela Cruz", age: 66 },
  { national_id: "2345-6789-0125", name: "Martinez", age: 49 },
  { national_id: "4567-8901-2347", name: "Hernandez", age: 26 },
  { national_id: "6789-0123-4569", name: "Lopez", age: 17 },
  { national_id: "8901-2345-6791", name: "Fernandez", age: 51 },
  { national_id: "4264-4451-5545", name: "Diaz", age: 38 }
]

citizen_data.each do |person|
  new_citizen = Citizen.new(person[:national_id], person[:name], person[:age])
  new_citizen.save
end

puts Citizen.all_records.inspect
puts "==========================="
puts "First person in the Record:"
Citizen.first_record.display_record

puts "Last person in the Record:"
Citizen.last_record.display_record

puts "Enter the National ID to search the user:"
search_user = gets.chomp
user = Citizen.find_by_national_id(search_user)
if user
  puts "User found!"
  puts "National ID: #{user.national_id}, Name: #{user.name}, Age: #{user.age}"
else
  puts "User not found."
end

puts "Enter the National ID to update the user record:"
update_user_id = gets.chomp
user = Citizen.find_by_national_id(update_user_id)

if user
  puts "Enter 'age' to edit the age"
  puts "Enter 'name' to edit the name"
  edit_choice = gets.chomp.downcase

  case edit_choice
  when 'age'
    puts "Update age:"
    new_age = gets.chomp.to_i
    user.age = new_age
    puts "Updated | National ID: #{user.national_id} Name: #{user.name} Age: #{user.age}"
  when 'name'
    puts "Update name:"
    new_name = gets.chomp
    user.name = new_name
    puts "Updated | National ID: #{user.national_id} Name: #{user.name} Age: #{user.age}"
  else
    puts "Invalid choice. Please enter 'age' or 'name'."
  end
else
  puts "User not found."
end

puts "\nUpdated Record:"
Citizen.all_records.each { |record| record.display_record }

Citizen.count
puts "Total Citizen Record: #{Citizen.count}"

Citizen.destroy_all
puts "Destroy all: #{Citizen.all_records}"

Citizen.count
puts "Total Citizen Record after Destroy: #{Citizen.count}"