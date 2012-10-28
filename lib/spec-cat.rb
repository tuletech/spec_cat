require 'rspec'
require 'spec-cat/matchers/have_a_spec'
require 'spec-cat/matchers/eql_file'

require 'spec-cat/railtie' if defined?(Rails)

module SpecCat

  def self.accept?
    !ENV[ 'SPEC_CAT_ACCEPT' ].nil?
  end

  def self.write( path, content )
    File.open( path,'wb' ) { |io| io.write content }
  end

  def self.read( path )
    File.open( path, 'rb' ) { |io| io.read }
  end

end