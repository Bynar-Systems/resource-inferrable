require 'active_support/concern'

module Resource
  module Inferrable
    module Concern
      extend ActiveSupport::Concern
      included do
        before_action :infer_resource, except: %i[index create]
      end
      # The resource class based on resource_name
      def resource_class
        @resource_class ||= resource_name.classify.constantize
      end

      # The singular resource name based on controller name
      # Override in controllers with non conventional names, make sure to underscore the name to avoid potential issues
      def resource_name
        @resource_name ||= controller_name.singularize.underscore
      end

      # Sets resource based on id param
      def infer_resource(resource = nil)
        resource ||= resource_class.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
      end

      # Returns the resource from the created instance variable
      def resource
        instance_variable_get("@#{resource_name}")
      end

      # Returns an array of all model attributes except created_at and updated_at
      def model_attributes
        resource_class.attribute_names.map(&:to_sym) - %i[created_at updated_at]
      end

      # Plural name based on resource name
      def plural_resource_variable
        "@#{resource_name.pluralize}"
      end

      # Only allow a trusted parameter "white list" through.
      # the inheriting controller for the resource must implement
      # the method "#{resource_name}_params" to limit permitted
      # parameters for the individual model.
      # Inorder to handle create/update methods.
      def resource_params
        @resource_params ||= send("#{resource_name}_params")
      end
    end
  end
end
