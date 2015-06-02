require('sinatra')
require('sinatra/reloader')
require('./lib/task')


get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/') do
	description = params.fetch('description')
	task = Task.new(description)
	task.save
	erb(:success)
end