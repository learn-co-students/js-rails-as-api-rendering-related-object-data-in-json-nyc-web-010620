class SightingsController < ApplicationController
    def show 
        if sighting = Sighting.find_by(id: params[:id])
            render json: sighting, include: [:bird, :location]
        else
            render json: { message: "No Sightings here you dingus!"} 
        end 
    end 

    def index 
        sightings = Sighting.all 
        render json: sightings, include: [:bird, :location]
        
    end 
end
