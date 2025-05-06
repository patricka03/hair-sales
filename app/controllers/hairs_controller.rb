class HairsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @hairs = Hair.all
  end

  def new
    @hair = Hair.new
  end

end
