class TrainingFee < Request
  attribute :account, :string, default: '研修費'
  
  before_save   :training_fees_description
    
  private
  
    def training_fees_description
    self.description = "研修費　#{self.description}"
    end
end