class ScoresController < ApplicationController
  def index
    score = Score.all.order(highScore: :desc).take(10)
    scores = []
    score.map do |s|
      scores.push(nickname: User.find(s.user_id).nickname, score: s.highScore)
    end

    respond_to do |format|
      format.html
      format.json { render json: scores}
    end
  end

  def create
    score = Score.new
    score.user_id = User.where(nickname: score_params[:nickname]).first.id
    score.highScore = score_params[:score]
    score.save
  end

  private

  def score_params
    params.permit(:nickname, :score)
  end
end
