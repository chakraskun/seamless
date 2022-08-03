module Faqs
  module Broadcast extend ActiveSupport::Concern
    def refresh_table
      broadcast_update_to(
        'faqs',
        target: 'faqs_table',
        partial: "admin/faqs/table",
        locals: {
          faqs: Faq.all,
        }
      )
    end
  end
end