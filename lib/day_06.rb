class DaySix

  def self.count_unique_answers(texts)
    accu = []
    texts.each do |t|
      accu.push(t.chars)
    end
    accu.flatten.uniq.length
  end

  def self.count_common_answers(texts)
    texts.reduce(texts[0].chars) { |sum, t| sum & t.chars.uniq }.length
  end
end
