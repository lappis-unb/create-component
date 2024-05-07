# frozen_string_literal: true

module Decidim
  module $Plural_name$
    class $Plural_name$Type < Decidim::Api::Types::BaseObject
      implements Decidim::Core::ComponentInterface

      graphql_name "$Plural_name$"
      description "A $plural_name$ component of a participatory space."

      field :$plural_name$, Decidim::$Plural_name$::$Singular_name$Type.connection_type, null: true, connection: true

      def $plural_name$
        $Singular_name$.where(component: object).includes(:component)
      end

      field :$singular_name$, Decidim::$Plural_name$::$Singular_name$Type, null: true do
        argument :id, GraphQL::Types::ID, required: true
      end

      def $singular_name$(**args)
        $Singular_name$.where(component: object).find_by(id: args[:id])
      end
    end
  end
end
