require 'rails_helper'

describe Authorizable do

  let(:my_token){'/this is my token/'}

  it 'should store the authentication token prepended by baerer' do
    #setup
    expected_token = 'this is my token'
    #exercise
    Authorizable.set_token my_token
    #verify
    expect(Authorizable.get_token).to eq 'bearer ' + expected_token
  end

  it 'should sign in when I have a token stored' do
    Authorizable.set_token my_token
    expect(Authorizable).to be_signed_in
  end

  it 'should sign in when I have a token stored' do
    my_token = 'banana'
    Authorizable.set_token my_token
    Authorizable.clear_token
    expect(Authorizable).to_not be_signed_in
    expect(Authorizable.get_token).to be_nil
  end
end