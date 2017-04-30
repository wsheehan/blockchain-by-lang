require 'digest'

require_relative 'block'
require_relative 'block_helper'
require_relative 'hash_helper'

include BlockHelper
include HashHelper

blockchain = [genesis_block]

p valid_new_block?(genesis_block, genesis_block)


