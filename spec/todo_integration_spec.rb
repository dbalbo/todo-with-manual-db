require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list and see the details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('description', :with =>'List Name')
    click_button("Get 'Er Done!")
    expect(page).to have_content('Success!')
  end
end
 describe('viewing all of the lists', {:type = :feature}) do
   it('allows a user to see all of the lists that have been created') do
     list = List.new({:description => 'Epicodus homeowrk'})
     list.save
     visit('/')
     click_button("View All Lists")
     expect(page).to have_content(list.description)
   end
 end
 describe('seeing details for a single list', ({:type => :feature}) do
   it('allows a user to click on a list and see the details for it') do
     test_list = List.new({:description => 'school stuff'})
     test_list.save
     test_task = Task.new({:description => 'learnSQL', :list_id => test_list.id})
     test_task.save
     visit('/lists')
     click_link(test_list.description)
     expect(page).to have_content(test_task.decription)
   end
 end
