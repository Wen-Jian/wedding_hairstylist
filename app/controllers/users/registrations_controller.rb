# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # errorarray = []
    # @users = User.all
    # params[:role_id].to_i
    # @user = User.new(sign_up_params)
    # @user.role_id = params[:role_id]
    # if @user.password != params[:password_confirmation]

    #   errorarray.append("密碼不一致")

    # end

    # if @user.password.length < 6

    #   errorarray.append("密碼至少六碼")

    # end

    # @users.each do |u|

    #   if @user.email == u.email

    #     errorarray.append("信箱已註冊過")

    #   end

    # end

    # if errorarray.count != 0
      
    #   flash[:error] = errorarray

    # end

    # if @user.save

    #   redirect_to :root

    # else
      
    #   render :new

    # end

    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params

     devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])

   end

   def sign_up_params

      params.require(:user).permit(:email, :password, :role_id)
     
   end
  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:role_id])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
