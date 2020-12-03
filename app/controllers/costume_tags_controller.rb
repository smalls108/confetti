class CostumeTagsController < ApplicationController
  skip_after_action :verify_authorized, only: [:new, :create]
  def new
    @costume = Costume.find(params[:costume_id])
    @costume_tag = CostumeTag.new
  end

  def create
    @costume = Costume.find(params[:costume_id])
    @tags = Tag.find(params[:costume_tag][:tag])
    @tags.each do |tag|
      costume_tag = CostumeTag.new
      costume_tag.costume = @costume
      costume_tag.tag = tag
      costume_tag.save
    end
     redirect_to costumes_path
    # redirect_to garden_path(@plant.garden)
  end

  def destroy
  end
end
