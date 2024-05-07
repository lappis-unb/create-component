# frozen_string_literal: true

module Decidim
  module $Plural_name$
    # This class serializes the specific data in each $singular_name$. This is the $singular_name$
    # data outside of the component settings.
    class DataSerializer < Decidim::Exporters::Serializer
      include Decidim::TranslationsHelper

      # Serializes the $singular_name$ data for this component.
      #
      # @return [Hash] The serialized data
      def serialize
        $singular_name$ = $Singular_name$.find_by(component: resource)

        {
          body: $singular_name$&.body || empty_translatable
        }
      end
    end
  end
end
