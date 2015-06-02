require('rspec')
require('task')

describe(Task)  do
	before do
		Task.clear
	end

	describe('#description') do
		it('lets you give a description of a task') do
		test_task = Task.new('wash my car')
		expect(test_task.description).to(eq('wash my car'))
		end
	end

		describe('.all') do
			it('is empty at first') do
				expect(Task.all).to(eq([]))
			end
		end

		describe('#save') do
			it('adds a task to the list and saves it') do
				test_task = Task.new('clean my room')
				test_task.save
				expect(Task.all).to(eq([test_task]))
			end
		end
		describe('.clear') do
			it('empties out all of the saved tasks') do
				Task.new('clean my room').save
				Task.clear
				expect(Task.all).to(eq([]))
			end
		end
	end