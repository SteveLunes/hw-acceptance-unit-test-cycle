require 'rails_helper'

describe Movie do
  describe '.find_with_same_director' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'The Departed', director: 'Steven Spielberg') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Super Eight', director: 'David Fincher') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "A Raisin in the Sun", director: 'Steven Spielberg') }
    let!(:movie4) { FactoryGirl.create(:movie, title: nil) }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.find_with_same_director(movie1.title)).to eql(['The Departed', "A Raisin in the Sun"])
        expect(Movie.find_with_same_director(movie1.title)).to_not include(['Super Eight'])
        expect(Movie.find_with_same_director(movie2.title)).to eql(['Super Eight'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.find_with_same_director(movie4.title)).to eql(nil)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end