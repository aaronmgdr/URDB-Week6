require 'spec_helper'

describe Movie do
  let(:movie) { Movie.new }
  let(:rotten_finder_return) { OpenStruct.new(ratings: OpenStruct.new(audience_score: 84)) }

  describe "#snippet" do
    context "when description is less than or equal to 50 characters" do
      it "returns the full description" do

        allow(movie).to receive(:description).and_return("abcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxy")

        expect(movie.snippet).to eq('abcdefghijklmnopqrstuvwxyabcdefghijklmnopqrstuvwxy')

      end
    end

    context "when description is greater than 50 characters" do
      it "returns the first 47 characters and appends '...'" do

        allow(movie).to receive(:description).and_return("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz")

        expect(movie.snippet).to eq('abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstu...')

      end
    end

    context "when description is nil" do
      it "returns an empty string" do

        allow(movie).to receive(:description).and_return(nil)

        expect(movie.snippet).to eq('')
      end
    end
  end

  describe "#audience_rating" do
    context "when Movie is found on Rotten Tomatoes" do
      it "returns the audience score for the Movie" do
        allow(movie).to receive(:rotten_finder).and_return(rotten_finder_return)

        expect(movie.audience_rating).to eq(84)
      end
    end

    context "when Movie is not found on Rotten Tomatoes" do
      it "returns nil" do
        allow(movie).to receive(:rotten_finder).and_return([])

        expect(movie.audience_rating).to eq(nil)
      end
    end
  end

  describe '.average_rating' do
    let (:movie2) { Movie.new }

    context 'when all movies can be found on Rotten Tomatoes' do

      it 'returns the average audience_score for all movies' do
        allow(movie).to receive(:audience_rating).and_return(100)
        allow(movie2).to receive(:audience_rating).and_return(50)
        allow(Movie).to receive(:all).and_return([movie, movie2])

        expect(Movie.average_rating).to eq(75)
      end
    end

    context 'when some movies are not found on Rotten Tomatoes' do
      it 'returns the average audience_score of the movies that were found'
    end

    context 'when no movies are found on Rotten Tomatoes' do
      it 'returns nil'
    end
  end
end
