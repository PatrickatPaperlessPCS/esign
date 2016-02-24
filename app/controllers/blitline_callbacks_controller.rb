class BlitlineCallbacksController < ApplicationController
  skip_before_filter :verify_authenticity_token

	def create
	  url = params[:results][:images][0][:s3_url]
	  regex = %r[images/(?<template_id>\d+)/]
	  m = url.match(regex)
	  template_id = m[:template_id].to_i
	  template = Template.find(template_id)
	  template.processed_attachement_url = url
	  template.save!
	  
	  render nothing: true
	end

end