class Block

  def initialize(block_index, previous_block_hash, timestamp, data, block_hash)
    @block_index = blockIndex
    @previous_block_hash = previous_block_hash
    @timestamp = timestamp
    @data = data
    @block_hash = block_hash
  end

  def block_index
    @block_index
  end

  def previous_block_hash
    @previous_block_hash
  end

  def timestamp
    @timestamp
  end

  def data
    @data
  end

  def block_hash
    @block_hash
  end
end