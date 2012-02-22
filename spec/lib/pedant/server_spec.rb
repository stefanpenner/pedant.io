require 'pedant'
require 'rack/test'

describe 'App' do
  include Rack::Test::Methods

  let(:app) { Pedant::Server }

  before do
    Git.mock_remote = 'spec/support/test_repo'
  end

  context 'get /' do
    subject { get '/' }

    its(:status) { should == 302 }
  end

  context 'post /api/v1/repository' do
    subject { post '/api/v1/repository', url: 'stefanpenner/pedant' }

    its(:status) { should == 200 }
    its(:body)   { should =~ /done/ }
  end
end
