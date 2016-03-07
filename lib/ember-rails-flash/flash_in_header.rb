require 'htmlentities'
module EmberRailsFlash
  # include this in your top-level controller (ApplicationController)
  module FlashInHeader
    def self.included(controller)
      raise(ArgumentError, "#{self} must be included in a controller") unless controller.respond_to?(:after_filter)
      controller.after_filter :add_flash_to_header_if_xhr
    end

    def add_flash_to_header_if_xhr
      if request.xhr?
        flash.each do |severity, message|
          key = severity.to_s.underscore.gsub('_','-')
          response.headers["X-Flash-#{key}"] = HTMLEntities.new.encode(message, :basic, :decimal)
        end
        # make sure flash does not appear on the next page
        flash.discard
      end
    end
  end
end

