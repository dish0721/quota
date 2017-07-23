# Preview all emails at http://localhost:3000/rails/mailers/sendupvote
class SendupvotePreview < ActionMailer::Preview
    def sample_mail_preview
     Sendupvote.sample_email(User.first)
   end
end
