class UpvoteQuestionController < ApplicationController
	before_action :authenticate_user!

	def toggle_vote
		@question = Question.find(params[:question_id])
		upvote = UpvoteQuestion.where(user: current_user, question: @question).first
		if upvote
			upvote.destroy!
			@is_upvote_questioned = false	
		else
			email=params[:email]
			UpvoteQuestion.create(user: current_user, question: @question)
			@is_upvote_questioned = true
			Sendupvote.sample_email(email).deliver_now
		end
 
		respond_to do |format|
			format.js {}
		end
		
	end
end
