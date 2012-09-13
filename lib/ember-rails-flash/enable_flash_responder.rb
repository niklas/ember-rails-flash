module EmberRailsFlash
  def self.enable_flash_responder(format='json')
    if defined?(Responders::FlashResponder)
      to_meth = :"to_#{format}"
      unless Responders::FlashResponder.public_instance_methods.include?(to_meth)
        Responders::FlashResponder.class_eval <<-EORUBY
          def #{to_meth}
            set_flash_message! if set_flash_message?
            defined?(super) ? super : to_format
          end
        EORUBY
      else
        Rails.logger.debug { "Responders::FlashResponder##{to_meth} is already defined" }
      end
    else
      Rails.logger.debug { "cannot find Responders::FlashResponder to enable flash on #{format}" }
    end
  end
end
