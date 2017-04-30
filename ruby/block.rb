class Block

  def initialize(blockIndex, previousBlockHash, timestamp, data, blockHash)
    @blockIndex = blockIndex
    @previousBlockHash = previousBlockHash
    @timestamp = timestamp
    @data = data
    @blockHash = blockHash
  end

  def blockIndex
    @blockIndex
  end

  def previousBlockHash
    @previousBlockHash
  end

  def timestamp
    @timestamp
  end

  def data
    @data
  end

  def blockHash
    @blockHash
  end
end