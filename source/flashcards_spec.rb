require_relative 'model'
# require_relative 'controller'
require_relative 'view'

describe FlashCard do
  let(:flashcard) { FlashCard.new({}) }
#this is testing the state of our class object.
  it 'Initializes with some default value' do
    expect(flashcard.category).to eq(nil)
  end
end

describe Dealer do
  let(:dealer) { Dealer.new('game_questions.csv')}
#we are testing that our class creates the data structures we expect.
  it 'Initializes @file as an array' do
    expect(dealer.file.class).to eq(Array)
  end

  it 'Initializes @file as an array of hashes' do
    true_false = dealer.file.all? { |hash| hash.class == Hash }
    expect(true_false).to eq(true)
  end

  context "#load_card" do
    it 'should return a single FlashCard object' do
      expect(dealer.load_card).to be_kind_of(FlashCard)
    end
  end

  context "#check" do
    it "should return true for two equal values." do
      expect(dealer.check("foo bar", "foo bar")).to eq(true)
    end

    it "should return false for two non-equal values." do
      expect(dealer.check("foo bar", "bar foo")).to eq(false)
    end
  end
end
