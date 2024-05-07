# frozen_string_literal: true

module Decidim
  module $Plural_name$
    module Admin
      # This command is executed when the user changes a $singular_name$ from the admin
      # panel.
      class Update$Singular_name$ < Decidim::Command
        # Initializes a Update$Singular_name$ Command.
        #
        # form - The form from which to get the data.
        # $singular_name$ - The current instance of the $singular_name$ to be updated.
        def initialize(form, $singular_name$)
          @form = form
          @$singular_name$ = $singular_name$
        end

        # Updates the $singular_name$ if valid.
        #
        # Broadcasts :ok if successful, :invalid otherwise.
        def call
          return broadcast(:invalid) if @form.invalid?

          update_$singular_name$
          broadcast(:ok)
        end

        private

        def update_$singular_name$
          Decidim.traceability.update!(
            @$singular_name$,
            @form.current_user,
            body: @form.body
          )
        end
      end
    end
  end
end
