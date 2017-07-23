class Sendupvote < ApplicationMailer
	# default_from:'railsproject100@gmail.com'

def sample_email(email)
	# @user = User.first



     # @email = email

     # @email = user.email
     @email=email
     mail(to: email, subject: 'Sample Email')
  
     # mail(to: current_user.email, subject: 'Sample Email')
  end


  def upvote

  end
end
