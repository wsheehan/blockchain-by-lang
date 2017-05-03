class Array
  def arr_to_json
    objects_to_hashes.to_json
  end

  private

    def objects_to_hashes
      new_chain = []
      self.each do |el|
        el.is_a?(Object) ? new_chain.push(el.to_hash) : new_chain.push(el)
      end
      new_chain
    end
end