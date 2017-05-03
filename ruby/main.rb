require 'digest'
require 'sinatra'
require 'json'

require_relative 'object'
require_relative 'array'
require_relative 'block'
require_relative 'block_helper'

include BlockHelper

@blockchain = [genesis_block]

def http_server(blockchain)
  get '/blockchain' do
    content_type :json
    blockchain.arr_to_json
  end

  post '/mine' do
    content_type :json
    new_block = generate_next_block(params["data"], blockchain)
    add_block(new_block, blockchain).arr_to_json
  end
end

http_server(@blockchain)


