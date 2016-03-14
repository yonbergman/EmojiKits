class Api::KitController < ActionController::API
  include ActionController::Serialization

  def index
    @kits = Kit.all
    render json: @kits, root: 'kits'
  end

  def show

  end
end