require 'spec_helper'
require 'rake'

describe 'spec_cat rake tasks' do

  before( :each ) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake::Task.define_task(:environment)
    load 'lib/tasks/spec_cat.rake'
  end

  describe 'rake spec_cat:accept' do

    it 'runs specs and accepts all ground truth file changes' do
      expected = 'rspec spec'
      Kernel.should_receive( :system ).with( expected )
      @rake[ 'spec_cat:accept' ].invoke
      ENV[ 'SPEC_CAT_ACCEPT' ].should  eql( '1' )
    end

  end

  describe 'rake spec_cat:coverage' do

    it 'runs specs and opens the coverage report' do
      expected = 'rspec spec && open coverage/index.html'
      Kernel.should_receive( :system ).with( expected )
      @rake[ 'spec_cat:coverage' ].invoke
    end

  end


end