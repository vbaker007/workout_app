class ExercisesController < ApplicationController
  before_action :set_exercise, except: [:index, :new, :create]

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercise.new(exercise_params)

    if @exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to (current_user, @exercise)

    else
      flash[:danger] = "Exercise has not been created"
      render :new
    end
  end

  private

    def exercise_params
      params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
    end
end
