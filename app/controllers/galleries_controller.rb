class GalleriesController < ApplicationController

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save

        if params[:images]
          params[:images].each { |image|
            @gallery.pictures.create!(image: image)
          }
        end

        format.html { redirect_to @gallery, notice: 'Sua galeria foi criada com sucesso.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.save

        if params[:images]
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end

        if params[:deleted_images]
          params[:deleted_images].each { |image_id|
            @gallery.pictures.find(image_id).destroy!
          }
        end

        format.html { redirect_to @gallery, notice: 'Sua galeria foi atualizada com sucesso.' }
        format.json { render json: @gallery, status: :updated, location: @gallery }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end