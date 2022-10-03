class Api::V1::BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :update, :destroy]
  # GET /businesses
  def index
    @businesses = Business.all.includes(:reviews).order("created_at DESC")
    @business_records_with_associations = @businesses.map do |record|
      record.attributes.merge(
        'review' => record.reviews,
      )
    end
    response.headers["item_count"] = @business_records_with_associations.count
    paginate json: @business_records_with_associations
  end

  # GET /businesses/1
  def show
    render json: @business
  end

  # POST /businesses
  def create
    @user = logged_in_user
    @business = @user.businesses.create(business_params)
    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      render json: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
  end

  def search
      @description = params[:desc].downcase
      @category = params[:category].downcase
      @city = params[:city].downcase
      @name = params[:name].downcase
      @results = Business.all.where("lower(businesses.state) LIKE :city AND lower(businesses.description) LIKE :desc
      AND lower(businesses.name) LIKE :name AND lower(businesses.category) LIKE :category", category: "%#{@category}%", desc: "%#{@description}%",  name: "%#{@name}%", city: "%#{@city}%")
      # render json: { data: @results }, status: :ok
      @results_records_with_associations = @results.includes(:reviews).order('created_at DESC').map do |record|
        record.attributes.merge(
          'review' => record.reviews,
        )
      end
      paginate json: @results_records_with_associations
    # if @results.size.zero?
    #   render json: { data: 'no search matches' }, status: :ok
    # else
    #   render json: { data: nil}
    # end
  end

  # def search
  #   if params[:search].blank?
  #     render json: { data: 'Please enter a value'}, status: :ok
  #   elsif !params[:search].blank?
  #     @parameter = params[:search].downcase
  #     @results = Business.all.where("lower(businesses.name) LIKE :search OR lower(businesses.description) LIKE :search
  #     OR lower(businesses.category) LIKE :search", search: "%#{@parameter}%")
  #     # render json: { data: @results }, status: :ok
  #     paginate json: @results.order('created_at DESC')
  #   elsif @results.size.zero?
  #     render json: { data: 'no search matches' }, status: :ok
  #   else
  #     render json: { data: nil}
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_params
      params.permit(:name, :address, :email, :phone, :description, :category, :pricing, :cover_photo, :state)
    end
end
