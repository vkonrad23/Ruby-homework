class Student
    attr_accessor :surname, :name, :date_of_birth
  
    @@students = []
  
    def initialize(surname, name, date_of_birth)
      @surname = surname
      @name = name
      @date_of_birth = date_of_birth
      validate_date_of_birth
      self.class.add_student(self)
    end
  
    def self.students
      @@students
    end
  
    def self.add_student(student)
      unless @@students.any? { |s| s.surname == student.surname && s.name == student.name && s.date_of_birth == student.date_of_birth }
        @@students << student
      else
        raise ArgumentError, "Duplicate student not allowed"
      end
    end
  
    def self.remove_student(student)
      @@students.delete(student)
    end
  
    private
  
    def validate_date_of_birth
      # Add your validation logic here
    end
  end
  
  # Create some Student instances
  student1 = Student.new("Doe", "John", "2000-01-01")
  student2 = Student.new("Smith", "Jane", "2001-02-02")
  
  # Print the list of students
  puts Student.students.inspect