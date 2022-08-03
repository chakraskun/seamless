module ApplicationHelper
  include Pagy::Frontend

  def options_order_faq
    Faq.all.pluck(:order)
  end
end
