require 'spec_helper'

describe 'postcode' do

  before(:all) do
    @postcode = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/e163jt').body)
  end

  it 'status should be integer' do
    expect(@postcode['status']).to be_kind_of(Integer)
  end

  it 'postcode shoud be a present' do
    expect(@postcode['result']['postcode']).not_to be_empty
  end

  it 'postcode shoud be a string' do
    expect(@postcode['result']['postcode']).to be_kind_of(String)
  end

  it "postcode should include a space" do
    expect(@postcode['result']['postcode']).to include(" ")

  end

  it 'qualiy should be integer' do
    expect(@postcode['result']['quality']).to be_kind_of(Integer)
  end

  it 'quality should be a number between 1 and 9' do
    expect(@postcode['result']['quality']).to be_between(1, 9).inclusive
  end

  it "eastings should be an integer unless its a postcode of Channel Islands or Isle of Man" do
    if @postcode['result']['postcode'].start_with?('GY', 'IM')
      expect(@postcode['result']['eastings']).to be_nil
    else
      expect(@postcode['result']['eastings']).to be_kind_of(Integer)
    end
  end

  it "northings should be an integer unless its a postcode of Channel Islands or Isle of Man" do
    if @postcode['result']['postcode'].start_with?('GY', 'IM')
      expect(@postcode['result']['northings']).to be_nil
    else
      expect(@postcode['result']['northings']).to be_kind_of(Integer)
    end
  end

  it 'country shoud be a string' do
    expect(@postcode['result']['country']).to be_kind_of(String)
  end

  it 'nhs_ha shoud be a string or null' do
    expect(@postcode['result']['nhs_ha']).to be_kind_of(String)
  end

  it "admin country should be a string or nil" do
    unless @postcode['result']['admin_county'].nil?
      expect(@postcode['result']['admin_county']).to be_kind_of(String)
    end
  end
end
