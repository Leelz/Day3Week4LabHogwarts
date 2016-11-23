require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/student' )

#list all the students
get '/students' do
  @student = Student.all
  erb(:index)
end

#make a new student with form
get '/students/new' do
  erb(:new)
end

#actually create the student in database (save)
post '/students' do
student = Student.new( params )
student.save
redirect to('/students')
end

#delete a student from the db
post '/students/:id/delete' do
  Student.destroy( params[:id]  )
  redirect to('/students')
end

#show a student from the db
get '/students/:id' do
  @student = Student.find( params[:id] )
  erb(:show)
end

#show the edit student form
get '/students/:id/edit' do
  @student = Student.find( params[:id] )
  erb(:edit)
end

#update a student
post '/students/:id' do
  Student.update( params)
  redirect to ("/students/#{params[:id]}")
end



