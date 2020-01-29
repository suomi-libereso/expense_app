class EntertainmentFee < Request
  attribute :account, :string, default: '接待交際費'
    
  before_save   :entertainment_fees_description
    
  private
  
    def entertainment_fees_description
    self.description = "接待交際費　#{self.description}"
    end
end