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

        expect(response.body).to eq "Hello Jess"
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
end