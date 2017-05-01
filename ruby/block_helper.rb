require_relative 'block'

module BlockHelper
  def genesis_block
    Block.new(0, "0", Time.now.to_i.to_s, "Genesis Block", Digest::SHA256.hexdigest('genesis block'))
  end

  def latest_block(blockchain)
    blockchain[blockchain.length - 1]
  end

  def generate_next_block(block_data)
    previous_block = latest_block
    block_index = previous_block.block_index + 1
    timestamp = Time.now.to_i.to_s
    block_hash = Digest::SHA256.hexdigest(block_index.to_s, previous_block.block_hash, timestamp, block_data)
    Block.new(block_index, previous_block.block_hash, timestamp, block_data, block_hash)
  end

  def valid_new_block?(new_block, previous_block)
    conditions = {
      (new_block.block_index == (previous_block.block_index + 1)) => "Invalid index",
      (previous_block.block_hash == new_block.previous_block_hash) => "Invalid previous block hash"
      (calculate_block_hash == new_block.block_hash) => "Invalid block hash"
    }
    conditions.each do |k,v|
      puts v unless k
      return false
    end
  end

  def calculate_block_hash(block)
    Digest::SHA256.hexdigest(block.block_index.to_s, block.previous_block_hash, block.timestamp, block.data)
  end
end