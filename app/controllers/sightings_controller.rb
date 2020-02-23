class SightingsController < ApplicationController
    def show 
        sighting = Sighting.find_by_id(params[:id])
        if sighting
            render json: sighting.to_json(:include => { :bird => { :only => [:name, :species]}, :location => { :only => [:latitude, :longitude]} }, :except => [:updated_at, :created_at])    
        else 
            render json: { message: 'Sighting has not been found' }
        end
    end
end
