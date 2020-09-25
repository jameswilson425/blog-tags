class Api::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render "index.json.jb"
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @tag = Tag.new(
      tiitle: params[:title],
      text: params[:text],
      image_url: params[:image_url],
    )
    if @tag.save
      render "show.json.jb"
    else
      render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @tag = Tag.find_by(id: params[:id])
    @tag.title = params[:title] || @tag.title
    @tag.text = params[:text] || @tag.text
    @tag.image_url = params[:image_url] || @tag.image_url

    if @tag.save
      render "show.json.jb"
    else
      render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    tag = Tag.find_by(id: params[:id])
    tag.destroy
    render json: { message: "tag destroyed successfully!" }
  end
end
