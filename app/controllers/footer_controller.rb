class FooterController < ApplicationController

  def connect
    @connect = Connect.new
  end

  def about
  end

  def feedback
  end

  def create
    @connect = Connect.new(:content => params['connect']['content'])
    @connect.user = current_user

    if @connect.save
      flash[:success] = "We have received, Thank you !"
      redirect_to '/connect'
    else
      render 'connect'
    end
  end

end
