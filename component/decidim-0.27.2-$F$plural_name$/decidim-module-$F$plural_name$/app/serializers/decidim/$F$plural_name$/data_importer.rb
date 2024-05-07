# frozen_string_literal: true

module Decidim
  module $Plural_name$
    # Importer for $Plural_name$ specific data (i.e. its $singular_name$ content).
    class DataImporter < Decidim::Importers::Importer
      def initialize(component)
        @component = component
      end

      # Creates a new Decidim::$Plural_name$::$Singular_name$ associated to the given **component**
      # for the serialized $singular_name$ object.
      #
      # @param serialized [Hash] The serialized data read from the import file.
      # @param _user [Decidim::User] The user performing the import.
      # @return [Decidim::$Plural_name$::$Singular_name$] The imported $singular_name$
      def import(serialized, _user)
        return unless serialized

        $Singular_name$.create!(
          component: @component,
          body: serialized["body"]
        )
      end
    end
  end
end
