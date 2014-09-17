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

  action = line.split

  act = action[0]
  name = action[1]
  if act == "Add"
    cc = action[2]
    limit = action[3][1..-1].to_i #removes '$' sign
  else
    ammount = action[2][1..-1].to_i
  end

  case act

    when "Add"
      if Luhn.valid? cc
        instance[:"#{name}"] = CreditCard.new(limit) #CreditCard.new(limit, name, cc) if we needed in the class
      else
        instance[:"#{name}"] = "error"
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

#Output
instance.sort.map do |key, v|
  puts defined?(v.balance) ? "#{key}: $#{v.balance}" : "#{key}: #{v}"
end







