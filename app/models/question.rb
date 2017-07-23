class Question < ActiveRecord::Base
  # before_action:authenticate_user
  belongs_to :user
  has_many :answers
  has_many :upvote_questions
  validates :content, presence: true, length: {maximum: 300}

  def upvote_questioned_by user_id
  	UpvoteQuestion.where(question_id: id, user_id: user_id).length > 0
  end




  def upvote_question_string user_id
  	if upvote_questioned_by user_id
  		return "Downvote"
  	else
  		return "Upvote"
  	end

  end

end
