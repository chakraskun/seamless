class BaseService
  def error_messages
    @error_messages ||= []
  end

  def full_error_messages
    @full_messages ||= error_messages.join('\n')
  end

  def full_error_messages_html
    @full_messages ||= error_messages.join('<br/>')
  end

  def run
    validate_before_action
    return false if error_messages.present?

    ActiveRecord::Base.transaction do
      action
    end
    teardown_setup

    return handle_unraised_error if error_messages.present?
    return true
  rescue => e
    Rails.logger.error "[SERVICE][ERROR] #{e}"
    error_messages << e.message
    return false
  end

  def handle_unraised_error
    raise error_messages.join('<br/>')
  end

  def validate_before_action; end
  def teardown_setup; end
end
