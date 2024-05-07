# frozen_string_literal: true

module Decidim
  module $Plural_name$
    # Command that gets called whenever a component's $singular_name$ has to be duplicated.
    # It's need a context with the old component that
    # is going to be duplicated on the new one
    class Copy$Singular_name$ < Decidim::Command
      def initialize(context)
        @context = context
      end

      def call
        Decidim::$Plural_name$::$Singular_name$.transaction do
          $plural_name$ = Decidim::$Plural_name$::$Singular_name$.where(component: @context[:old_component])
          $plural_name$.each do |$singular_name$|
            Decidim::$Plural_name$::$Singular_name$.create!(component: @context[:new_component], body: $singular_name$.body)
          end
        end
        broadcast(:ok)
      rescue ActiveRecord::RecordInvalid
        broadcast(:invalid)
      end
    end
  end
end
