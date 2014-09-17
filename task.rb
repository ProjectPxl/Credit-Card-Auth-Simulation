#Dependencies
require 'luhn'
require_relative 'credit_card.rb'

# Declaring viarbles
instance = {}
fopen = ARGV[0]

act = nil
name = nil
cc = nil
limit = nil
ammount = nil

# Main process
File.readlines(fopen).each do |line|

  action = line.split(" ")

  act = action[0]
  if act == "Add"
    name = action[1]
    cc = action[2]
    limit = action[3][1..-1].to_i
  else
    name = action[1]
    ammount = action[2][1..-1].to_i
  end

  case act

    when "Add"
      if instance[:"#{name}"]
        puts "#{name}'s record already exists. Add a unique record or use any of the 'Charge, Credit' actions instead"
      else
        if Luhn.valid? cc
          instance[:"#{name}"] = CreditCard.new(limit) #CreditCard.new(limit, name, cc) if we need them in the class
          balances[:"#{name}"] = instance[:"#{name}"].balance
        else
          instance[:"#{name}"] = "error"
        end
      end

    when "Charge"
      if instance[:"#{name}"] && instance[:"#{name}"] != "error"
        instance[:"#{name}"].charge!(ammount)
      end

    when "Credit"
      if instance[:"#{name}"] && instance[:"#{name}"] != "error"
        instance[:"#{name}"].credit!(ammount)
      end

    else
      puts "Unknown action specified."
  end

end

instance.sort.map do |key, v|
  if v != "error"
    puts "#{key}: $#{v.balance}"
  else
    puts "#{key}: error"
  end
end







