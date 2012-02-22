require './lib/pedant'
require 'ruby-git'

describe 'Pedant::Project' do
  context 'valid Project' do
    subject do
      Pedant::Project.new('stefanpenner/pedant.io')
    end

    before do
      Git.mock_remote = File.dirname(__FILE__) + '/../..//support/test_repo'
    end

    let(:path) { [FileUtils.pwd,'tmp', 'stefanpenner', 'pedant.io'].join('/') }

    describe '#path' do
      its(:path) { should == path }
    end

    describe '#clone!' do
      it 'clones' do
        subject.rm_rf!
        Dir[path + '/*'].should be_empty
        subject.clone!
        Dir[path + '/*'].should_not be_empty
      end
    end

    describe '#rm_rf!' do
      it 'cleans' do
        subject.clone!
        Dir[path + '/*'].should_not be_empty
        subject.rm_rf!
        Dir[path + '/*'].should be_empty
      end
    end
  end
end
