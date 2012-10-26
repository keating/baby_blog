#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def initialize
    super
    @title = 'AiBaby育儿经'
    @title_tail = ' | AiBaby育儿经'
  end
end
