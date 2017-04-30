module BlockHelper
  def genesis_block
    Block.new(0, "0", Time.now().to_s, "Genesis Block", Digest::SHA256.hexdigest('genesis block'))
  end

  def valid_new_block?(new_block, previous_block)
    conditions = {
      (new_block.blockIndex == (previous_block.blockIndex + 1)) => "Invalid index",
      (previous_block.blockHash == new_block.previousBlockHash) => "Invalid previous block hash"
      # (calculate_block_hash == new_block.blockHash) => "Invalid block hash"
    }
    conditions.each do |k,v|
      puts v unless k
      return false
    end
  end
end