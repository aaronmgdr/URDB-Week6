require 'spec_helper'

describe Movie do
  let(:movie) { Movie.new }

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

  end
end
