# frozen_string_literal: true

module Faqs
  class BaseService < ::BaseService

    def initialize params
      @params = params
    end

    protected
      def faq_params
        @faq_params ||= @params
          .require(:faq)
          .permit(
            :question,
            :answer
          )
      end
  end
end
