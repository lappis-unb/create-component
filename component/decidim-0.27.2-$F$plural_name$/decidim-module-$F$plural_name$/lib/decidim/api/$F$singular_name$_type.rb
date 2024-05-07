# frozen_string_literal: true

module Decidim
  module $Plural_name$
    class $Singular_name$Type < Decidim::Api::Types::BaseObject
      description "A $singular_name$"

      field :id, GraphQL::Types::ID, null: false
      field :title, Decidim::Core::TranslatedFieldType, "The title of this $singular_name$ (same as the component name).", null: false
      field :body, Decidim::Core::TranslatedFieldType, "The body of this $singular_name$.", null: true
      field :created_at, Decidim::Core::DateTimeType, "The time this $singular_name$ was created", null: false
      field :updated_at, Decidim::Core::DateTimeType, "The time this $singular_name$ was updated", null: false
    end
  end
end
