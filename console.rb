require('pry-byebug')
require_relative('models/student.rb')
require_relative('models/house.rb')

Student.delete_all()

student1 = Student.new({'first_name' => 'Andrew', 'second_name' => 'Longbottom', 'house' => 'Gryffindor', 'age' => '26'})

student2 = Student.new({'first_name' => 'Septima', 'second_name' => 'Diggory', 'house' => 'Hufflepuff', 'age' => '26'})

student1.save()
student2.save()

house1 = House.new({'house_name' => 'Gryffindor', 'logo' => 'http://vignette3.wikia.nocookie.net/harrypotter/images/9/96/Gryffindor_crest_by_tuliipiie-d491bqc.jpg/revision/latest?cb=20130508231701'})

house2 = House.new({'house_name' => 'Slytherin', 'logo' => 'https://i.ytimg.com/vi/4y_-ArWJuQg/maxresdefault.jpg'})

house3 = House.new({'house_name' => 'Ravenclaw', 'logo' => 'http://vignette3.wikia.nocookie.net/harrypotter/images/9/94/Ravenclaw_Logo.jpg/revision/latest?cb=20140627182803'})

house4 = House.new({'house_name' => 'Hufflepuff', 'logo' => 'https://s-media-cache-ak0.pinimg.com/originals/e0/e2/bc/e0e2bca469b63385d89ec2f1250e4ca5.jpg'})

house1.save()
house2.save()
house3.save()
house4.save()

binding.pry
nil