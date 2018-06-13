Spree::Core::ControllerHelpers::Store.module_eval do
  # This method was moved from order helper
  def current_currency
    if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
      session[:currency]
    else
      Spree::Config[:currency]
    end
  end
end
