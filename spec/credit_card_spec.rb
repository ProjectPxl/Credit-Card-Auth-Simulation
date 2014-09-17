require 'minitest/autorun'
require_relative '../lib/credit_card'

describe CreditCard do

  before do
    @record = CreditCard.new(100)
  end

  describe "charge method" do

    it "should charge" do
      @record.charge!(99)
      @record.balance.must_equal 99
    end

    it "shouldn't charge" do
      @record.charge!(101)
      @record.balance.must_equal 0
    end
    
  end

  describe "credit method" do

    it "should credit" do
      @record.credit!(99)
      @record.balance.must_equal -99
    end
    
  end
end