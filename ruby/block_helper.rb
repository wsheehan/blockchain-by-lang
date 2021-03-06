require_relative 'block'

module BlockHelper
  # Blockchains require hard coded genesis blocks
  def genesis_block
    Block.new(0, "0", Time.now.to_i.to_s, "Genesis Block", Digest::SHA256.hexdigest('genesis block'))
  end

  # New block require latest block info to proceed
  def latest_block(blockchain)
    blockchain[-1]
  end

  # Generate params for new block
  def generate_next_block(block_data, blockchain)
    previous_block = latest_block(blockchain)
    p previous_block
    block_index = previous_block.block_index + 1
    timestamp = Time.now.to_i.to_s
    block_hash = Digest::SHA256.hexdigest(block_index.to_s + previous_block.block_hash + timestamp + block_data)
    Block.new(block_index, previous_block.block_hash, timestamp, block_data, block_hash)
  end

  # Ensure new block is indexed and hashed correctly
  def valid_new_block?(new_block, previous_block)
    conditions = {
      (new_block.block_index != (previous_block.block_index + 1)) => "Invalid index",
      (previous_block.block_hash != new_block.previous_block_hash) => "Invalid previous block hash",
      (calculate_block_hash(new_block) != new_block.block_hash) => "Invalid block hash"
    }
    conditions.each do |k,v|
      if k
        puts v
        return false
      end
    end
    true
  end

  # Push new block into blockchain
  def add_block(new_block, blockchain)
    blockchain.push(new_block) if valid_new_block?(new_block, latest_block(blockchain))
  end

  # Hash block params with SHA-256
  def calculate_block_hash(block)
    Digest::SHA256.hexdigest(block.block_index.to_s + block.previous_block_hash + block.timestamp + block.data)
  end
end