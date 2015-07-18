require 'spec_helper'

describe EmberRailsFlash::FlashInHeader do
  let(:controller_class) { Class.new(ApplicationController) }
  let(:controller) { controller_class.new }

  before do
    controller_class.class_eval do
      include EmberRailsFlash::FlashInHeader
    end

    controller.stub request: request
    controller.stub response: response
    request.flash.stub discard: true
  end

  let(:request) {
    double 'Request', flash: {}, xhr?: true
  }

  let(:response) {
    double 'Response', headers: {}
  }


  context '#add_flash_to_header_if_xhr' do
    it 'adds any flash message to the header' do
      controller.flash[:notice] = 'Ich habe fertig.'
      controller.flash[:alert] = 'Other Castle.'

      controller.add_flash_to_header_if_xhr

      response.headers['X-Flash-Notice'].should == 'Ich habe fertig.'
      response.headers['X-Flash-Alert'].should == 'Other Castle.'
    end

    it 'escapes UTF8 as HTML entities' do
      controller.flash[:notice] = 'Erfolgreich hinzugefügt'
      controller.add_flash_to_header_if_xhr
      response.headers['X-Flash-Notice'].should == 'Erfolgreich hinzugef&#252;gt'
    end

  end

end
