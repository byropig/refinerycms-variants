Given /^I have no variants$/ do
  Variant.delete_all
end

Given /^I (only )?have variants titled "?([^\"]*)"?$/ do |only, titles|
  Variant.delete_all if only
  titles.split(', ').each do |title|
    Variant.create(:name => title)
  end
end

Then /^I should have ([0-9]+) variants?$/ do |count|
  Variant.count.should == count.to_i
end
