class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    flash.notice = "The `#{@tag.name}` tag was deleted! You will never see it again!"
    @tag.destroy
    redirect_to tags_path
  end
end
