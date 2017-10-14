class PagesController < ApplicationController

  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    render :about
    @header = "this is the welcome page"
  end

  def contest
    @header = "this is the contest page"
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to welcome_path
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url ="http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end

  def kitten
  end

  def kittens
  end

  def secrets
    if params[:magic_word] = "hello"
      redirect_to secret_path(:magic_word)
    else
      flash[:alert] = "Authorization Required"
      redirect_to welcome_path
    end
  end

end
