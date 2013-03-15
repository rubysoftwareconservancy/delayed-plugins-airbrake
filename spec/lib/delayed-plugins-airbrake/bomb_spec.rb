require 'delayed-plugins-airbrake'

module Delayed::Plugins::Airbrake
  describe Bomb do
    describe '.blow_up' do
      it 'raises a test exception' do
        lambda { Bomb.blow_up }.should raise_error(RuntimeError)
      end
    end
  end
end
