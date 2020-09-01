class CoverLettersController < ApplicationController
  def create
    cover_letter = CoverLetter.new(cover_letter_params)

    if cover_letter.save
      render json: {status: 'cover_letter created successfully'}, status: :created
    else
      render json: { errors: cover_letter.errors.full_messages }, status: :bad_request
    end
  end

  def show
    cover_letter = CoverLetter.find(params[:id])
    render json: CoverLetterSerializer.new(cover_letter).serialized_json
  end

  private def cover_letter_params
    base_params
      .permit(:url, :orientation, :user_id)
  end
end
