class Url < ApplicationRecord
  validates :link,:short_url, uniqueness: true
  validates :stats, numericality: { greater_than_or_equal_to: 0 }

  def incr
    self.stats = self.stats.next
    self.save!
  end
end
