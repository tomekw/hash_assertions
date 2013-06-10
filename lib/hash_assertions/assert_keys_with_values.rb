class Hash
  def assert_keys_with_values(*keys_with_values)
    keys_with_values.each do |key_with_value|
      required_value = fetch(key_with_value, nil)

      if required_value.nil?
        raise ArgumentError, "No value for key: #{key_with_value}"
      end
    end
  end
end
