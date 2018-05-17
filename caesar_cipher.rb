class CaesarCipher
  def initialize(string, *shift)
    @string = string
    @shift = shift.join.to_i
    @alphabet_downcase = Array('a'..'z')
    @alphabet_upcase = Array('A'..'Z')
  end

  def perform
    if @shift == 0
      @shift += 13
    end
    rotation_downcase = Hash[@alphabet_downcase.zip(@alphabet_downcase.rotate(@shift))]
    rotation_upcase = Hash[@alphabet_upcase.zip(@alphabet_upcase.rotate(@shift))]
    result = @string.chars.map! do |c|
      if ("a".."z").include?(c)
        rotation_downcase.fetch(c)
      elsif ("A".."Z").include?(c)
        rotation_upcase.fetch(c)
      else
        c
      end
    end
    result.join
  end
end
