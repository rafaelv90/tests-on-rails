require 'timecop'
require_relative '../auction'


RSpec.describe Auction do
  let(:auction) { Auction.new }

  context 'when started' do
    it 'should save the initial time' do
      Timecop.freeze do
        auction.start
        expect(auction.started).to eq Time.now
      end
    end

    it 'should change its status' do
      auction.start
      expect(auction.status).to eq 1
    end
  end

  context 'after 2 minutes' do
    it 'should not accept bids' do
      auction.start

      Timecop.travel(Time.now + 120) do
        expect(auction.bid(300)).to be_falsey
      end
    end
  end
end
