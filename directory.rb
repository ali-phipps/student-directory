@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end

end
	
# and then print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list(students)
  
  #find l
  puts @students.map { |p| p[:name] }.uniq
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
	
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items  
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
	

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
	
interactive_menu
	
	