When /^I request the "([^"]*)" endpoint using credentials "([^"]*)":"([^"]*)"$/ do |endpoint, email, pwd|
  visit_authenticated_endpoint(endpoint, {:user => email, :password => pwd})
end

When /^I request the "([^"]*)" endpoint$/ do |endpoint, email, pwd|
  visit_endpoint(endpoint)
end


Then /^I should receive a json list like:$/ do |table|
  compare_json_list_to_table(from_json(@response), table)
end

Then /^I should receive a json hash like:$/ do |table|
  compare_json_hash_to_table_row_hash(from_json(@response), table.hashes.first)
end

Given /^the existing BD:$/ do |table|
  table.hashes.each do |row|
    klass.make(row) #uses machinist
  end
 
Given /^authorized with role ([a-zA-Z0-9]+s):$/ do |klasses, table|
  klass = klasses.singularize.camelize.constantize
  table.hashes.each do |row|
    klass.make(row) #uses machinist
  end 
end
