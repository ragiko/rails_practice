module ApplicationHelper
  def to_hankaku(str)
    # http://ref.xaio.jp/ruby/classes/string/tr
    # irb -> helper.to_hankaku(..)で参照可能
    str.tr('Ａ-Ｚａ-ｚ', 'A-Za-z')
  end
end
