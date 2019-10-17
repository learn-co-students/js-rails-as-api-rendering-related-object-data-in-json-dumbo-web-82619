class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end

  def show
    sighting = Sighting.find(params[:id])
    #conditional for errors
    if sighting
      render json: sighting.to_json(include: [:bird, :location])
    else
      render json: { message: 'No sighting found with that id' }
    end
    #render json: sighting, include: [:bird, :location]
    #render json: {id: sighting.id, bird: sighting.bird, location: sighting.location} => alternative
  end

end
