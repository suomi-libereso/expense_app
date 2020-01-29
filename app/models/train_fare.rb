class TrainFare < Request
  validates :entarting_station, presence: true, length: { in: 1..30 }
  validates :gettingoff_station, presence: true, length: { in: 1..30 }
  validates :via_station, presence: true, length: { in: 1..30 }

  attribute :account, :string, default: '交通費'
  attribute :type, :string, default: 'TrainFare'
  
  before_save   :train_fare_description
  
  private
  
    #文字連結して摘要に保存
    def train_fare_description
      self.description = "電車賃　#{self.entarting_station}駅～#{self.gettingoff_station}駅"
    end
  
end