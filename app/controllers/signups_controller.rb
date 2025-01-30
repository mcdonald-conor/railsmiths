class SignupsController < ApplicationController
  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      # Send welcome email in the background
      SignupMailer.welcome_email(@signup).deliver_later
      redirect_to success_signups_path
    else
      flash.now[:alert] = @signup.errors.full_messages.to_sentence
      respond_to do |format|
        format.html { redirect_to root_path, alert: @signup.errors.full_messages.to_sentence }
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('form_response',
            partial: 'shared/error_message'
          )
        end
      end
    end
  end

  def success
    render layout: 'application'
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
