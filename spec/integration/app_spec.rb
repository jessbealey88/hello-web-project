require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
   include Rack::Test::Methods
   
   let(:app) {Application.new}

   context 'GET /hello' do
      it 'returns 200 OK' do
        response = get('/hello')

        expect(response.status).to eq(200)
      end

      it "returns hello message" do
        response = get('/hello?name=Jess')

        expect(response.body).to include ('<h1>Hello Jess!</h1>')
      end
   end

   context 'GET /names' do
      it 'returns 200 OK' do
        response = get('/names')

        expect(response.status).to eq(200)
      end
      it "returns the list of names" do
        response = get('/names?names=Julia, Mary, Karim')

        expect(response.body).to eq "Julia, Mary, Karim"
      end
   end

   context "POST /sort-names" do
    it "returns a sorted list of names" do
    response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

    expect(response.status).to eq (200)
    expect(response.body). to eq "Alice,Joe,Julia,Kieran,Zoe"
    end
   end

      
end