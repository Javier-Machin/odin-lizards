require 'test_helper'
require 'benchmark'

class RootTest < ActionDispatch::IntegrationTest
  puts Benchmark.measure {
    test 'visit new' do
      get '/lizards/new'
    end
  }
end
