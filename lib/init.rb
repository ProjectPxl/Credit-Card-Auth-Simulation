#Dependencies
require 'luhn'
require_relative 'credit_card.rb'
require_relative 'helpers.rb'


# Declaring viarbles
instance = {}

# Main process
File.readlines(ARGV[0]).each do |line|

  action = line.split

  case action[0]

    when "Add"
      add(action[1], action[2], action[3][1..-1].to_i, instance)

    when "Charge"
      charge_or_credit(action[1], action[2][1..-1].to_i, "charge", instance)

    when "Credit"
      charge_or_credit(action[1], action[2][1..-1].to_i, "credit", instance)

    else
      puts "Unknown action specified."
  end

end

#Output
instance.sort.map do |key, v|
  puts defined?(v.balance) ? "#{key}: $#{v.balance}" : "#{key}: #{v}"
end
