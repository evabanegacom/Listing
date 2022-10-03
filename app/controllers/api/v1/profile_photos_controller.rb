class Api::V1::ProfilePhotosController < ApplicationController
  before_action :set_profile_photo, only: [:show, :update, :destroy]

  # GET /profile_photos
  def index
    @profile_photos = ProfilePhoto.all

    render json: @profile_photos
  end

  # GET /profile_photos/1
  def show
    render json: @profile_photo
  end

  # POST /profile_photos
  def create
    @profile_photo = ProfilePhoto.new(profile_photo_params)

    if @profile_photo.save
      render json: @profile_photo, status: :created, location: @profile_photo
    else
      render json: @profile_photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profile_photos/1
  def update
    if @profile_photo.update(profile_photo_params)
      render json: @profile_photo
    else
      render json: @profile_photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profile_photos/1
  def destroy
    @profile_photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_photo
      @profile_photo = ProfilePhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_photo_params
      params.permit(:business_id, :photo1, :photo2, :photo3, :photo4, :photo5)
    end
end
