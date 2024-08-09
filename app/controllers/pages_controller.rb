class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :playground ]

  def home
    @show_navbar = true
  end

  def playground
  end
end
