class UsersController < ApplicationController
    def show
      user = User.find(params[:id])
      items = user.items
  
      response = {
        id: user.id,
        username: user.username,
        city: user.city,
        items: items.map do |item|
          {
            id: item.id,
            name: item.name,
            description: item.description,
            price: item.price
          }
        end
      }
  
      render json: response
    end
  end