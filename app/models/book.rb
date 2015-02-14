class Book < ActiveRecord::Base
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }

  belongs_to :publisher

  has_many :book_authors
  has_many :authors, through: :book_authors

  # presence は 入力必須項目
  validates :name, presence: true
  validates :name, length: { maximum: 15 } 
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validate do |book|
    # エクササイズ嫌い validate
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise"
    end
  end
end
