require 'digest'
require 'sinatra'
require 'json'
require 'active_record'

require_relative 'block'
require_relative 'block_helper'

include BlockHelper

@blockchain = [genesis_block]

def http_server
  get '/blockchain' do
    content_type :json
    {"Hello" => "World"}.to_json
  end
end

http_server

