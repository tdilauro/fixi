require 'spec_helper'

describe "String#pack" do
  it 'should drop leading whitespace' do
    expect( "\n foo".pack ).to eq( "foo" )
  end

  it 'should drop trailing whitespace' do
    expect( "\n foo".pack ).to eq( "foo" )
  end

  it 'should turn multi whitespace into one space' do
    expect( "foo \n\n  bar".pack ).to eq( "foo bar" )
  end
end
