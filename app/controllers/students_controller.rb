class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @dojos = Dojo.all
  end

  def create
    Student.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], dojo:Dojo.find(params[:branch]))
    redirect_to '/'
  end

  def update
    student = Student.update(params[:id], first_name:params[:first_name], last_name:params[:last_name], email:params[:email], dojo:Dojo.find(params[:branch]))
    student.save
    redirect_to "/"
  end

  def edit
    @students = Student.find (params[:id])
    @dojo = Dojo.all
    @dojos = Dojo.find params[:dojo_id]
  end

  def show
    @dojos= Dojo.find params[:dojo_id]
    @students = @dojos.students.where.not(id: params[:student_id])
    @student = Student.find params[:student_id]
  end

  def destroy
    Student.destroy params[:id]
    redirect_to "/dojos/#{params[:dojo_id]}"
  end

end
