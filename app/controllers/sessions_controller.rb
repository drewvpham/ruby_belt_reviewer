class SessionsController < ApplicationController


  def destroy
      reset_session
      redirect_to '/'
    end


    private
      def login_params
        params.require(:user).permit(:email, :password)
      end

  end
