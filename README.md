# Postcodes HW


A RSpec ruby integration test, testing different components of the postcode.io api.

## Getting Started
These instructions will get you a copy of the tests up and running on your local machine. 

### Prerequisites

You will need the following gems:

* JSON
* HTTParty
* RSpec

To install, type in your terminal

`gem install json`
`gem install httparty`
`gem install rspec`


### Installing

To run the tests, do the following:

1. Click on the 'clone or download' green button on the top right hand corner.

2. Extract the folder from your downloads folder.

3. Open the file in a text editor 

4. Open folder in terminal


## Running The Tests

The tests in this documents test the general information displayed from the api and if all the fields are alligned correctly with the docmuentaion.

To run the tests, type `rspec` in your terminal. You should see a list of the tests and if they pass.

For example:

The following test,

	it 'Postcode shoud be a string' do
	    expect(@postcode['result']['postcode']).to be_kind_of(String)
	  end
Will test if the data in the postcode field is a string.
## Built With

* Ruby 2.4.1 - 
* RSpec 3.6 h- 
* JSON 2.1.0 - 
* HTTParty 0.15.6 -
