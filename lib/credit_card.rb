class CreditCard

  attr_reader :balance

  def initialize(limit)
    @balance = 0
    @limit = limit
    # @name, @cc if needed for the record
  end

  def charge!(ammount)
    if @balance + ammount < @limit
      @balance += ammount
    end
  end

  def credit!(ammount)
    @balance -= ammount
  end

end