class ScoresController < ApplicationController
  def index
    score = Score.all.order(highScore: :desc).take(10)
    currentRound = Score.last.id
    scores = []
    score.map do |s|
      scores.push(nickname: User.find(s.user_id).nickname, score: s.highScore)
    end

    respond_to do |format|
      format.html
      format.json { render json: [scores, currentRound]}
    end
  end

  def create
    score = Score.new
    user = current_user
    score.user_id = current_user.id
    score.highScore = score_params[:score]

    if score.highScore > 10_000
      current_user.update banned: true
      redirect_to banned_path
    end

    score.save
  end

  private

  def score_params
    params.permit(:nickname, :score)
  end
end
