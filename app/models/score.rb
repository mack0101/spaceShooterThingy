class Score < ApplicationRecord
	before_create :check_cheater

  attr_accessor :nickname

  private

  def check_cheater
  	if self.highScore > 15000
  		User.find( self.user_id ).update banned: true
  		self.highScore = 1
  	end
  end
end
