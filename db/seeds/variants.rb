if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'variants').blank?
      user.plugins.create(:name => 'variants',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

# if defined?(Page)
  # page = Page.create(
    # :title => 'Variants',
    # :link_url => '/variants',
    # :deletable => false,
    # :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    # :menu_match => '^/variants(\/|\/.+?|)$'
  # )
  # Page.default_parts.each do |default_page_part|
    # page.parts.create(:title => default_page_part, :body => nil)
  # end
# end