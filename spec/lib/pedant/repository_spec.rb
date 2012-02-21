require './lib/pedant'

describe 'Pedant::Repository' do
  context 'valid repository' do
    subject do
      Pedant::Repository.new('stefanpenner/pedant.io')
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
      it 'clones' do
        subject.clone!
        Dir[path + '/*'].should_not be_empty
        subject.rm_rf!
        Dir[path + '/*'].should be_empty
      end
    end
  end
end
