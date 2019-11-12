module PeopleHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == self.sort_column || column == 'location' || column == 'affiliation' ? "current #{self.sort_direction}" : nil
    direction = (column == self.sort_column || column == 'location' || column == 'affiliation') && self.sort_direction == "asc" ? "desc" : "asc"
    link_to title, request.parameters.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
