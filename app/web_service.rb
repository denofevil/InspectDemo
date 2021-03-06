class WebService
  KNOWN_WORDS = ["hello", "inspect", "motion", "ruby", "rubymotion", "jetbrains", "rubymine", ""]

  # @param [String] text
  # @return [Array] array of words with spelling error
  def self.validateText(text)
    words = text.split(/[ ,.!?#]/)
    words.reject {|w| KNOWN_WORDS.index(w.downcase)}
  end
end