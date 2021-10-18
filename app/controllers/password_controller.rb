class PasswordController < ApplicationController
  def reset
    token = request.query_parameters['token']
    @user = User.find_by_reset(token) or params['token'] or not_found

    if params['password']
      @user.password = params['password']
      @user.save 
      render plain: "Successful reset password"
    end 
  end

  def forgot
    if params['email']
      user = User.find_by_email(params['email'])
      if user
        token = SecureRandom.hex(10)
        user.reset = token
        user.save
        ResetMailer.with(user: @user).reset_password
      end
      render plain: "A link to reset the your password has been emailed"
    end
  end
end
