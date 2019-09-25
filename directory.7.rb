

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
   puts "Enter Cohort"
   cohort = gets.chomp.to_sym
   if cohort.empty?
     cohort = :November
     puts cohort
   end
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
      puts "Enter Cohort"
   cohort = gets.chomp.to_sym
   if cohort.empty?
     cohort = :November
     puts cohort
   end
  end
  # return the array of students
  students
end
	
# and then print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  
  cohorts = students.map { |p| p[:cohort] }.uniq
  cohorts.each do |x|
    temp_students = students.select { |p| p[:cohort] == x}
    temp_students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
end
	
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
	