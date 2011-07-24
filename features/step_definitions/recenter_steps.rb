When /^number of visible lines is (\d+)$/ do |num|
  doc.num_lines_visible == num
end

Then /^line number (\d+) should be smallest visible line$/ do |line|
  doc.smallest_visible_line.should == line.to_i
end

Then /^line number (\d+) should be biggest visible line$/ do |line|
  doc.biggest_visible_line.should == line.to_i
end

def doc
  Redcar.app.focussed_window.focussed_notebook_tab.document
end