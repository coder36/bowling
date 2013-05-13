require './bowling.rb'

card = ""
my_score = ""

Given /I have entered my game card as (.*)/ do |s|
	# convert score to array
	s = s.gsub( "[", "").gsub( "].", "").gsub( "]", "")
	card = s.split( " ").map{ |n| n.split( ",").map{ |m| m.to_i} }
end

When /I ask for my score/ do
	my_score = score( card )
end

Then /the result should be (.*)/ do |r|
	my_score.should eq r.to_i
end
