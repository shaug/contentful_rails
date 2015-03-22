module ContentfulRails
  module Sluggable
    # A quick mixin to slugify a field other than 'slug'
    # NOTE that if you include sluggable (and define a slug field) in a class which responds to
    # slug() than you'll get a stack level too deep error.
    module Sluggable
      extend ActiveSupport::Concern

      class_methods do
        attr_accessor :slug_field
      end

      def slug
        if self.class.slug_field.present?
          self.send(self.class.slug_field).parameterize(Rails.configuration.x.param_delimiter)
        end
      end
    end
  end
end