#Helper methods
def add(name, cc, limit, instance)
  if Luhn.valid? cc
    instance[:"#{name}"] = CreditCard.new(limit) #CreditCard.new(limit, name, cc) if we needed in the class
  else
    instance[:"#{name}"] = "error"
  end
end

def charge_or_credit(name, ammount, act, instance)
  if instance[:"#{name}"] && instance[:"#{name}"] != "error"
    instance[:"#{name}"].send("#{act}!", ammount)
  end
end