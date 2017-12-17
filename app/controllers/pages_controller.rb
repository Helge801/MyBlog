class PagesController < ApplicationController
  # access all: [:home, :help, :legal, :about, :donate, :profile], user: :profile, admin: :all
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

  def my_profile
    @blogs = current_user.blog 
  end

  def profile

  end

  def account

  end
end
