require_relative('../models/student')
require_relative('../models/house')
require ('pry-byebug')

Student.delete_all
House.delete_all

house1 = House.new({"name" => "Gryffindor"})
house2 = House.new({"name" => "Hufflepuff"})
house3 = House.new({"name" => "Ravenclaw"})


house1.save
house2.save
house3.save
# #
# #
# #
student1 = Student.new({"first_name" => "harry", "last_name" => "potter", "age" => 14, "house_id" => house1.id})
student2 = Student.new({"first_name" => "juan", "last_name" => "something", "age" => 24, "house_id" => house2.id})
student3 = Student.new({"first_name" => "bob", "last_name" => "dillan", "age" => 40, "house_id" => house3.id})
# #
# #
student1.save
student2.save
student3.save


# p "no1 #{student1.first_name} "
# student1.delete
# student1.save
# p "no2 #{student1.first_name} "

# student1.first_name = "test"



# binding.pry
# nil
