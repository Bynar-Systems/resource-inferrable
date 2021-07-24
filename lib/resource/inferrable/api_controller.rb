require_relative 'concern'
require 'action_controller'
module Resource
  module Inferrable
    class APIController < ActionController::API
      include Resource::Inferrable::Concern
      # GET /{resource_name}/:id
      def show
        render json: resource
      end

      # POST /{plural_resource_name}
      def create
        infer_resource(resource_class.new(resource_params))
        if resource.save
          render json: resource, status: :created
        else
          render json: resource.errors, status: :unprocessable_entity
        end
      end

      # GET /{plural_resource_name}
      def index
        resources = apply_query(base_index_query, query_params)
                    .order(order_args)
                    .page(page_params[:page])
                    .per(page_params[:page_size])
        instance_variable_set(plural_resource_variable, resources)
        render_multiple
      end

      # DELETE /{resource_name}/:id
      def destroy
        infer_resource.destroy
        head :no_content
      end

      # PATCH/PUT /{resource_name}/:id
      def update
        if infer_resource.update(resource_params)
          render json: infer_resource
        else
          render json: infer_resource.errors, status: :unprocessable_entity
        end
      end

      protected

      # By default it is resource_class
      # Override for special filtering
      # Usage is base_index_query.where(...)...
      def base_index_query
        resource_class
      end

      # Returns the allowed parameters for searching
      # Override this method in each controller
      # to permit additional parameters to query on
      def query_params
        {}
      end

      # Returns the allowed parameters for pagination
      def page_params
        params.permit(:page, :page_size)
      end

      def apply_query(base, query_params)
        base.where(query_params)
      end

      def order_args
        :created_at
      end

      def render_multiple
        resources = instance_variable_get(plural_resource_variable)
        render json: {
          page: resources.current_page,
          total_pages: resources.total_pages,
          page_size: resources.size,
          "#{resource_name.pluralize}": resources.as_json
        }
      end
    end
  end
end
