require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('./lib/list')
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})


get('/') do
  erb(:index)
end


get('/lists/new') do
  erb(:list_form)
end

get('/lists') do
  @lists = List.all
  erb(:lists)
end

post('/lists') do
	description = params.fetch('description')
	list = List.new({:description => description, :id => nil})
	list.save
	erb(:success)
end
