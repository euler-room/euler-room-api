class ProblemsController < ApplicationController
  # before_action :authenticate_request!, only: [:show, :index, :update, :create]
  def show
    problem = Problem.find(params[:id])
    render json: ProblemSerializer.new(problem).serialized_json
  end

  def index
    problems = Problem.all
    render json: ProblemSerializer.new(problems).serialized_json
  end

  def create
    problem = Problem.new(problem_params)

    if problem.save
      render json: {status: 'Problem created successfully'}, status: :created
    else
      render json: { errors: problem.errors.full_messages }, status: :bad_request
    end
  end

  def update
    problem = Problem.find(params[:id])

    if problem.update(problem_params)
      render json: {status: 'Problem updated successfully'}, status: :updated
    else
      render json: { errors: problem.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    problem = Problem.find(params[:id])

    if problem.destroy
      render json: {status: 'Problem destroyed successfully'}, status: :destroyed
    else
      render json: { errors: problem.errors.full_messages }, status: :bad_request
    end
  end

  private def problem_params
    base_params
      .permit(:title, :solution, :solution_type, :description)
  end

  private def solution_params
    base_params
      .permit(:soluition)
  end
end
