require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/house')
require_relative('./models/student')


get "/" do
  @students = Student.all()
  erb(:home)
end


get "/student" do
  @students = Student.all()
  erb(:index)
end

get "/student/new" do
  @house = House.all()
  erb(:new)
end

get "/student/:id" do
   @student = Student.find(params[:id])
   @student.save()
  erb(:show)
end

post "/student" do
   @student = Student.new(params)
   @student.save()
  redirect "/student"
end

post "/student/:id/delete" do
   target =  Student.find( params[:id] )
   p target
   target.delete()
  redirect to "/student"
end

 # @student1.delete(142)



  # binding.pry
  # nil
