class Order < ActiveRecord::Base
<<<<<<< HEAD
    
    validates :quantity, presence: true
    validates :quantity, numericality: { only_integer: true, :allow_nil => false }
   
    before_update :Tax, :Price, :Totalamount
    before_save :Tax, :Price, :Totalamount
    
    def Tax
        self.tax = 0.13
        return self.tax
    end
    
    def Price
        self.price = self.quantity * Book.find(self.bookId).price
        return self.price
    end
    
    def Totalamount
            self.totalAmount = self.Price + (self.Price * self.Tax)
        return self.totalAmount
    end
=======
    belongs_to :user
>>>>>>> 0939b548f9f3fcd962766085141d2e4e78f91140
end
