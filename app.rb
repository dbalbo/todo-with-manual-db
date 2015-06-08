require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
require('pg')

DB = PG.connect({:dbname => 'to_do'})


get('/') do
  erb(:index)
end


get('/lists_new') do
  erb(:list_form)
end

get('/lists') do
  @lists = List.all
  erb(:lists)
end

post('/lists') do
	description = params.fetch('description')
	lists = List.new({:description => description, :id => nil})
	list.save
	erb(:success)
end
