class PassedOrFailed
  def initialize(hash, threshold)
    @hash = hash
    @threshold = threshold.to_i
    @passed_or_failed = { passed: {}, failed: {} }
  end

  def perform
    @hash.each_pair do |name, score|
      if score.to_i >= @threshold
        @passed_or_failed[:passed][name] = score.to_i
      else
        @passed_or_failed[:failed][name] = score.to_i
      end
    end
    @passed_or_failed
  end
end
