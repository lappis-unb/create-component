# frozen_string_literal: true

module Decidim
  module $Plural_name$
    module Admin
      # This class holds a Form to update $plural_name$ from Decidim's admin panel.
      class $Singular_name$Form < Decidim::Form
        include TranslatableAttributes

        translatable_attribute :body, String
      end
    end
  end
end
