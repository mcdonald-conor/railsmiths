module Mail
  class Resend
    attr_accessor :settings

    def initialize(settings)
      @settings = settings
    end

    def deliver!(mail)
      Resend.emails.send(
        from: mail.from.first,
        to: mail.to,
        subject: mail.subject,
        html: mail.html_part&.body&.raw_source,
        text: mail.text_part&.body&.raw_source
      )
    end
  end
end
