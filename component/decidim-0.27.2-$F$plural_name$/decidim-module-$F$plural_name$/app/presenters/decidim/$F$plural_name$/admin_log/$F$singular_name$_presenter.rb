# frozen_string_literal: true

module Decidim
  module $Plural_name$
    module AdminLog
      # This class holds the logic to present a `Decidim::$Singular_name$`
      # for the `AdminLog` log.
      #
      # Usage should be automatic and you shouldn't need to call this class
      # directly, but here's an example:
      #
      #    action_log = Decidim::ActionLog.last
      #    view_helpers # => this comes from the views
      #    $Singular_name$Presenter.new(action_log, view_helpers).present
      class $Singular_name$Presenter < Decidim::Log::BasePresenter
        private

        def diff_fields_mapping
          {
            body: :i18n
          }
        end

        def action_string
          case action
          when "update"
            "decidim.admin_log.$singular_name$.#{action}"
          else
            super
          end
        end

        def i18n_labels_scope
          "decidim.$plural_name$.admin.models.components"
        end
      end
    end
  end
end
