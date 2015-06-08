require('rspec')
require('pg')
require('list')
require('pry')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

  describe(List) do
    describe('.all') do
      it('starts off with no lists') do
        expect(List.all).to(eq([]))
      end
    end

  describe('#description') do
    it ('tells you its name') do
      list = List.new({:description => 'Epicodus stuff', :id => nil})
      expect(list.description).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      list.save
      expect(list.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      list.save
      expect(List.all).to(eq([list]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same description') do
      list1 = List.new({:description => 'Epicodus stuff', :id => nil})
      list2 = List.new({:description => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end
end