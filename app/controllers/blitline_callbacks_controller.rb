class BlitlineCallbacksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    puts params
    
    render nothing: true
  end
end