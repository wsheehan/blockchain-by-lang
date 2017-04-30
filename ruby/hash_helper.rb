module HashHelper
  def calculate_hash(blockIndex, previousBlockHash, timestamp, data)
    Digest::SHA256.hexdigest(blockIndex.to_s + previousBlockHash + timestamp + data)
  end
end