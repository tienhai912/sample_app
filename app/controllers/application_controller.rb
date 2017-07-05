class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_reader :user
  include SessionsHelper
end
