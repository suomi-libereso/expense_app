class ParkingFee < Request
    attribute :account, :string, default: '交通費'
    
    before_save   :parking_fee_description
    
    private
    
    def parking_fee_description
      self.description = "駐車場代"
    end
end