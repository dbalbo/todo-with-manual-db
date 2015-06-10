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
 describe('viewing all of the lists', {:type =>:feature}) do
   it('allows a user to see all of the lists that have been created') do
     list = List.new({:description => 'Epicodus Homework'})
     list.save
     visit('/')
     click_button("View All Lists")
     expect(page).to have_content(list.description)
   end
 end
 describe('seeing details for a single list', {:type => :feature}) do
   it('allows a user to click on a list and see the tasks and details for it') do
     test_list = List.new({:description => 'School stuff'})
     test_list.save
     test_task = Task.new({:description => 'learnSQL', :list_id => test_list.id})
     test_task.save
     visit('/lists')
     click_link(test_list.description)
     expect(page).to have_content(test_task.decription)
   end
 end

 describe("adding tasks to a list", {:type => :feature}) do
  it('allows a user to add a task to a list') do
    test_list = List.new({:name => "school stuff"})
    test_list.save
    visit('/lists/#{test_list.id}')
    fill_in("description", {:with => "Learn SQL"})
    click_link("Add Task")
    expect(page).to have_content("Success!")
  end
end
