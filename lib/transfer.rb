class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status=="pending"
      if @sender.balance > amount && valid?
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      end
    end
  end
end
