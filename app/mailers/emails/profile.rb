module Emails
  module Profile
    def new_user_email(user_id, password, token = nil)
      @user = User.find(user_id)
      @password = password
      @target_url = user_url(@user)
      @token = token
      mail(to: @user.email, subject: subject("Account was created for you"))
    end

    def new_email_email(email_id)
      @email = Email.find(email_id)
      @user = @email.user
      mail(to: @user.email, subject: subject("Email was added to your account"))
    end

    def new_ssh_key_email(key_id)
      @key = Key.find(key_id)
      @user = @key.user
      @target_url = user_url(@user)
      mail(to: @user.email, subject: subject("SSH key was added to your account"))
    end
  end
end
