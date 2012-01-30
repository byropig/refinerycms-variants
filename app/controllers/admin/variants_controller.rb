module Admin
  class VariantsController < Admin::BaseController

    crudify :variant,
            :title_attribute => 'name', :xhr_paging => true

  end
end
