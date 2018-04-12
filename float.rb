class Float
  def round_up_to(x)
    (self * 1/x).ceil.to_f / (1/x)
  end
end
