require 'csv'
@students = [] # an empty array accessible to all methods

def add_to_students(name,cohort)
  # add the student hash to the array
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_to_students(name,:November)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def load_students_from_file(filename="students.csv")
  if File.exists?(filename) # if it exists
  CSV.foreach(filename) do |line|
     name, cohort = line
     add_to_students(name,cohort.to_sym)
  end
  puts "loaded file successfully"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def initialise_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # no file provided so load default
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
    load_students_from_file(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list(students)
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
  puts "show students complete"
end

def get_file_name
  puts "Please enter a file name"
  return gets.chomp
end

def save_students
  file_name = get_file_name
  CSV.open(file_name,"wb") do |csv|
    @students.each do |student|
     csv << [student[:name], student[:cohort]]
    end
    puts "file saved successfully"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from a csv file"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students_from_file(get_file_name)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
	
def interactive_menu
  initialise_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

interactive_menu
	
	