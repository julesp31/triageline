class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :playground ]

  def home
    @show_navbar = false
  end

  def playground
  end
end
