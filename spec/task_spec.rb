require('spec_helper')


		describe(Task) do
			describe('.all') do
				it('is empty at first') do
					expect(Task.all).to(eq([]))
				end
			end
		end


		describe('#==') do
		it('is the same if it has the same task description') do
			task1 = Task.new({:description => 'learn SQL', :list_id => 1})
			task2 = Task.new({:description => 'learn SQL', :list_id => 1})
			expect(task1).to(eq(task2))
		end
	end



	describe('#description') do
		it('lets you give a description of a task') do
		test_task = Task.new({:description => 'wash my car', :list_id => 1})
		expect(test_task.description).to(eq('wash my car'))
		end
	end

		describe('#list_id') do
			it('lets you read the list id') do
				test_task = Task.new({:description => 'do my homework', :list_id => 1})
				expect(test_task.list_id).to(eq(1))
			end
		end

		describe('#save') do
			it('adds a task to the array of saved task') do
				test_task = Task.new({:description => 'clean my room', :list_id => 1})
				test_task.save
				expect(Task.all).to(eq([test_task]))
			end
		end
