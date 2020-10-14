class PropertiesController < ApplicationController

  def new
    @property = Property.new
    @property_and_station = @property.stations.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property
    else
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
    @property_and_station = @property.stations
  end

  def edit
    @property = Property.find(params[:id])
    @property_and_station = @property.stations
    @property_and_new_station = @property.stations.build
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property
    end
  end

  def index
    @properties = Property.all
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  private
  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :remark, stations_attributes: [:id, :route_name, :station_name, :minutes_on_foot])
  end

end
