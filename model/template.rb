class Template
  attr_accessor :parts
  def initialize(parts, missing_parts)
    @parts = parts
    @missing_parts = missing_parts
  end
end