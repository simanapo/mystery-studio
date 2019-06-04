class ApplicationController < ActionController::Base

  rescue_from DuplicatedError, with: :rescue409
  rescue_from AlreadyUpdated, with: :rescue409
  rescue_from AlreadyDeleted, with: :rescue404

  # リソースが見つからない
  def rescue404(e)
    logger.info "#{e.class.to_s} : #{e.message}"
    logger.info e.backtrace.join("\n") if Rails.env.development? && e.backtrace.present?

    render 'errors/not_found'

  end

  # リソースの競合
  def rescue409(e)
    logger.info "#{e.class.to_s} : #{e.message}" if Rails.env.development?
    logger.info e.backtrace.join("\n") if Rails.env.development? && e.backtrace.present?

    render 'errors/conflict'

  end

end
