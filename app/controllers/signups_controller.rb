class SignupsController < ApplicationController
  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      # Send welcome email
      SignupMailer.welcome_email(@signup).deliver_later

      respond_to do |format|
        format.html { redirect_to success_signups_path }
        format.turbo_stream { redirect_to success_signups_path }
      end
    else
      flash.now[:alert] = @signup.errors.full_messages.to_sentence
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream
      end
    end
  end

  def success
    # The success action just needs to render the view
  end

  def unsubscribe
    @signup = Signup.find(params[:id])
    @signup.destroy

    redirect_to root_path, notice: "Successfully unsubscribed from the waitlist."
  end

  private

  def signup_params
    params.require(:signup).permit(:email)
  end
end
