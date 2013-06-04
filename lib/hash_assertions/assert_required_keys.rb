class Hash
  def assert_required_keys(*required_keys)
    required_keys.each do |required_key|
      unless has_key?(required_key)
        raise ArgumentError, "Missing required key: #{required_key}"
      end
    end
  end
end
