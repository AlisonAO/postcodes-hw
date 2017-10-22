require 'spec_helper'

describe 'postcode' do

  before(:all) do
    @postcode = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/e163jt').body)
  end

  it 'Status should be integer' do
    expect(@postcode['status']).to be_kind_of(Integer)
  end

  it 'Postcode shoud be a present' do
    expect(@postcode['result']['postcode']).not_to be_empty
  end

  it 'Postcode shoud be a string' do
    expect(@postcode['result']['postcode']).to be_kind_of(String)
  end

  it "Postcode should include a space" do
    expect(@postcode['result']['postcode']).to include(" ")

  end

  it 'Qualiy should be integer' do
    expect(@postcode['result']['quality']).to be_kind_of(Integer)
  end

  it 'Quality should be a number between 1 and 9' do
    expect(@postcode['result']['quality']).to be_between(1, 9).inclusive
  end

  it "Eastings should be an integer unless its a postcode of Channel Islands or Isle of Man" do
    if @postcode['result']['postcode'].start_with?('GY', 'IM')
      expect(@postcode['result']['eastings']).to be_nil
    else
      expect(@postcode['result']['eastings']).to be_kind_of(Integer)
    end
  end

  it "Northings should be an integer unless its a postcode of Channel Islands or Isle of Man" do
    if @postcode['result']['postcode'].start_with?('GY', 'IM')
      expect(@postcode['result']['northings']).to be_nil
    else
      expect(@postcode['result']['northings']).to be_kind_of(Integer)
    end
  end

  it 'Country shoud be a string' do
    expect(@postcode['result']['country']).to be_kind_of(String)
  end

  it 'NHS Health Authority shoud be a string or null' do
    unless @postcode['result']['nhs_ha'].nil?
      expect(@postcode['result']['nhs_ha']).to be_kind_of(String)
    end
  end

  it "Admin country should be a string or nil" do
    unless @postcode['result']['admin_county'].nil?
      expect(@postcode['result']['admin_county']).to be_kind_of(String)
    end
  end

  it "Admin distric should be a string or nil" do
    unless @postcode['result']['admin_district'].nil?
      expect(@postcode['result']['admin_district']).to be_kind_of(String)
    end
  end

  it "Admin ward should be a string or nil" do
    unless @postcode['result']['admin_ward'].nil?
      expect(@postcode['result']['admin_ward']).to be_kind_of(String)
    end
  end

  it 'Longitude should be a float' do
    expect(@postcode['result']['longitude']).to be_kind_of(Float)
  end

  it "Latitude should be a float" do
    expect(@postcode['result']['latitude']).to be_kind_of(Float)
  end

  it 'Parliamentary Constituency should be either string or nil' do
    unless @postcode['result']['parliamentary_constituency'].nil?
      expect(@postcode['result']['parliamentary_constituency']).to be_kind_of(String)
    end
  end

  it "European electoral region to be a string" do
    unless @postcode['result']['european_electoral_region'].nil?
      expect(@postcode['result']['european_electoral_region']).to be_kind_of(String)
    end
  end

  it "Primary Care Trust should be a string" do
    unless @postcode['result']['primary_care_trust']
      expect(@postcode['result']['primary_care_trust']).to be_kind_of(String)
    end
  end

  it "Region should be a string" do
    unless @postcode['result']['region'].nil?
      expect(@postcode['result']['region']).to be_kind_of(String)
    end
  end

  it "Parish should be a string" do
    unless @postcode['result']['parish'].nil?
      expect(@postcode['result']['parish']).to be_kind_of(String)
    end
  end

  it "NUTS should be a string" do
    unless @postcode['result']['codes']['nuts'].nil?
      expect(@postcode['result']['codes']['nuts']).to be_kind_of(String)
    end
  end

end
