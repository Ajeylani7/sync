class SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      set_flash_message!(:alert, :invalid_sign_in)
      render :new
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # You can put the path you want to redirect to after sign in:
  def after_sign_in_path_for(resource)
    root_path
  end

  # Path after sign out
  def after_sign_out_path_for(resource_or_scope)
    new_session_path(resource_name)
  end
end
