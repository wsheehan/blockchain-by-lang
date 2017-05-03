require 'digest'
require 'sinatra'
require 'json'

require_relative 'object'
require_relative 'block'
require_relative 'block_helper'

include BlockHelper

@blockchain = [genesis_block]

def http_server(blockchain)
  get '/blockchain' do
    content_type :json
    blockchain.map! {|block| block.to_hash }
    blockchain.to_json
  end
end

http_server(@blockchain)


