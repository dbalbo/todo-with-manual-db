class List
attr_reader(:description, :id)

    define_method(:initialize) do |attributes|
      @description = attributes.fetch(:description)
      @id = attributes.fetch(:id)
    end

    define_singleton_method(:all) do
      returned_lists = DB.exec("SELECT * FROM lists;")
      lists = []
      returned_lists.each do |list|
        description = list.fetch("description")
        id = list.fetch("id").to_i
        lists.push(List.new({:description => description, :id => id}))
      end
      lists
    end
    define_method(:save) do
      result = DB.exec("INSERT INTO lists (description) VALUES('#{@description}') RETURNING id;")
      @id = result.first.fetch('id').to_i
    end

    define_method(:==) do |another_list|
      self.description.==(another_list.description).&(self.id.==(another_list.id))
    end
  end

    define_singleton_method(:find) do |id|
      found_list = nil
      List.all.each do |list|
        if list.id.== id
          found_list = list
        end
      end
      found_list

    define_method(:tasks) do
      list_tasks =[]
      tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id};")
      tasks.each do |task|
        description = task.fetch("description")
        list_id = task.fetch("list_id").to_i
        list_tasks.push(Task.new({:description => description,  :list_id => list_id}))
      end
      list_tasks
    end
  end



