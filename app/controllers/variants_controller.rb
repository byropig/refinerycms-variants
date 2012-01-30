class VariantsController < ApplicationController

  before_filter :find_all_variants
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @variant in the line below:
    present(@page)
  end

  def show
    @variant = Variant.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @variant in the line below:
    present(@page)
  end

protected

  def find_all_variants
    @variants = Variant.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/variants").first
  end

end
