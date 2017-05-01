module BlockHelper
  def genesis_block
    Block.new(0, "0", Time.now().to_s, "Genesis Block", Digest::SHA256.hexdigest('genesis block'))
  end

  def valid_new_block?(new_block, previous_block)
    conditions = {
      (new_block.block_index == (previous_block.block_index + 1)) => "Invalid index",
      (previous_block.block_hash == new_block.previous_block_hash) => "Invalid previous block hash"
      # (calculate_block_hash == new_block.blockHash) => "Invalid block hash"
    }
    conditions.each do |k,v|
      puts v unless k
      return false
    end
  end
end