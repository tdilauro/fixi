require 'spec_helper'

describe Fixi::Command::Init do
  describe "::synopsis" do
    it 'should be a non-empty string' do
      expect( Fixi::Command::Init::synopsis.length ).not_to eq( 0 )
    end
  end

  describe "::details" do
    it 'should be a non-empty string' do
      expect( Fixi::Command::Init::details.length ).not_to eq( 0 )
    end
  end

  describe "execute" do
    include FixiTestHelperMethods
    before do
      @command = Fixi::Command::Init.new
    end

    it "should accept zero args" do
      capture_stdout
      @command.execute([])
      release_stdout
    end

  end
end
