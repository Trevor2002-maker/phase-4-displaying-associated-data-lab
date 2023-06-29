# items_controller.rb
class ItemsController < ApplicationController
    def index
      items = Item.all.includes(:user)
  
      response = items.map do |item|
        {
          id: item.id,
          name: item.name,
          description: item.description,
          price: item.price,
          user: {
            id: item.user.id,
            username: item.user.username,
            city: item.user.city
          }
        }
      end
  
      render json: response
    end
  end