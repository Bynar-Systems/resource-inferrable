class DogsController < ApplicationController

  protected

  def dog_params
    attributes = model_attributes
    attributes.delete :id
    params.permit attributes
  end

  def query_params
    params.permit(:name)
  end
end
