class EatingEntertainmentFee < Request
  #validates_presence_of :number_of_people
  validates :number_of_people, presence: true, length: { maximum: 11 }, numericality: { only_integer: true, greater_than: 0 ,less_than_or_equal_to:100}
  attribute :account, :string, default: '接待交際費'
  attribute :smallamount_eating, :boolean, default: false
  
  before_save   :eating_entertainment_fee_description , :smallamount_eating?
  
  private
  
  #文字連結して摘要に保存
  def eating_entertainment_fee_description
    self.description = "接待飲食代　#{self.number_of_people}名"
  end
  
  #少額の接待飲食代かどうか判定する
  def smallamount_eating?
    if self.amount/self.number_of_people <= 5000
      self.smallamount_eating = true
    end
  end
end