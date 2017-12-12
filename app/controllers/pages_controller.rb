class PagesController < ApplicationController
  access all: [:home, :help, :legal, :about, :donate], user: :profile, admin: :all
  def home
  end

  def help
  end

  def legal
  end

  def about
  end

  def donate
  end

  def profile
  end
end
