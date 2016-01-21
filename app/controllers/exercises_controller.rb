class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = current_user.exercise.new
  end
end
