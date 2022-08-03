# frozen_string_literal: true

module Faqs
  class CreateService < ::Faqs::BaseService
    def action
      faq.save!
    end

    def faq
      @faq ||= Faq.new(faq_params)
    end
  end
end
