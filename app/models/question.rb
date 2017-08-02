class Question < ActiveRecord::Base
  # before_action:authenticate_user
  belongs_to :user
  has_many :answers
  has_many :upvote_questions
  validates :content, presence: true, length: {maximum: 300}

  def upvote_questioned_by user_id
  	# UpvoteQuestion.where(question_id: id, user_id: user_id).length > 0
    result = false
     Question.all.each do |question|
       result = question.user_id == user_id
       if result
         break
       end
     end
 
     return result
 
  end




  def upvote_question_string user_id
  	if upvote_questioned_by user_id
  		return "Downvote"
  	else
  		return "Upvote"
  	end

  end

  def can_modify user
    if User.roles[user.role] >= User.roles["editor"]
      return true
    else
      return user.id == user_id
    end

  end



end
