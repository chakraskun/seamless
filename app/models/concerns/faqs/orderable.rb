module Faqs
  module Orderable extend ActiveSupport::Concern
    included do
      before_validation :assign_order, on: [ :create ]
    end

    def assign_order
      existing_faq = Faq.count
      self.order = existing_faq + 1
    end
  end
end