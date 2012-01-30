module NavigationHelpers
  module Refinery
    module Variants
      def path_to(page_name)
        case page_name
        when /the list of variants/
          admin_variants_path

         when /the new variant form/
          new_admin_variant_path
        else
          nil
        end
      end
    end
  end
end
