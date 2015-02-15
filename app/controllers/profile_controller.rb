class ProfileController < ApplicationController
  def show
  end

  def edit
  end

  def update
    user = current_user
    # params[:user] => {name: "bob", email: "a@example.com"}
    user.update(user_params)
  end
  
  private
  # strong parametersによるバリデーション
  def user_params
    if current_user.admin?
      # 受け取れるパラメーターはnameとemailのみ
      params.require(:user).permit(:name, :email, :admin)
    else
      params.require(:user).permit(:name, :email)
    end
  end
end
