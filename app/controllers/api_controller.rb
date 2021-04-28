# frozen_string_literal: true

class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate
  
    def authenticate
      return @company = ::Company.first if Rails.env.test?
  
      authenticate_token || (head :unauthorized)
    end
  
    def authenticate_token
      api_key = request.headers['Authorization']
  
      head :unauthorized and return if api_key.nil?
  
      match_key = ::ApiKey.where(api_key: api_key).first
      head :unauthorized and return if match_key.nil?
  
      @company = ::Company.find_by(id: match_key.company_id)
      head :unauthorized and return if @company.nil?
  
      true
    end
  end
  