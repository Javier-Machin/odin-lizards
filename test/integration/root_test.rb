require 'test_helper'

class RootTest < ActionDispatch::IntegrationTest

  test 'visit new' do
    get '/lizards/new'
  end

end
