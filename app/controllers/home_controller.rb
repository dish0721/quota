class HomeController < ApplicationController
	before_action :authenticate_user! 
  def index

     @question=Question.new
     # @question=Question.all
    Sendupvote.sample_email(current_user).deliver_now

     respond_to do |format|
        format.html{
             @question = Question.new
             @feed = current_user.feed.limit(10)
 
        }
        format.js{
             offset = params["offset"]
             if offset
               offset = offset.to_i
             else
               offset = 0
             end
 
             @new_offset = offset + 10
             @show_load_more = offset < current_user.feed.count
             @feed = current_user.feed.offset(offset).limit(10)
        }
     end
  end

  def ajax
  	render :json => {text: "text"}
  end

  def users
     @users = User.all
   end
 
 
   def follow
     followee_id = params[:followee_id]
     if current_user.can_follow followee_id
       FollowMapping.create(:followee_id => followee_id, :follower_id => current_user.id)
     else
     end
     return redirect_to '/users'
   end
 

end
