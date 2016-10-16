module EmulationSupport

  def search_user(name)
    fill_in 'firstName', :with => name
    click_button 'Filter'
  end

end

World(EmulationSupport)