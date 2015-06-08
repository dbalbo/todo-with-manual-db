require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list and see the details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('description', :with => 'Epicodus Work')
    click_button('Add List')
    expect(page).to have_content("Success!")
  end
end
 describe('viewing all of the lists', {:type = :feature}) do
   it('allows a user to see all of the lists that have been created') do
     list = List.new({:name => 'Epicodus homeowrk'})
     list.save
     visit('/')
     click_button("View All Lists")
     expect(page).to have_content(list.description)
   end
 end
