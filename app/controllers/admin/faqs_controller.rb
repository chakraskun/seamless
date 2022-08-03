module Admin
  class FaqsController < Admin::ApplicationController
    def index
      @total_faqs = Faq.count
      @new_faq = Faq.new
      @faqs = Faq.all.order(:order)
    end

    def create
      service = ::Faqs::CreateService.new(params)
      unless service.run
        return redirect_to admin_faqs_path,
          alert: "Failed to create faq, #{service.error_messages.to_sentence}"
      end
    end

    def update
      service = ::Faqs::UpdateService.new(params)
      unless service.run
        return redirect_to admin_faqs_path,
          alert: "Failed to update faq, #{service.error_messages.to_sentence}"
      end
      return
    end
    

    private

  end
end
