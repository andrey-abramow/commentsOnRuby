class User
  @@users_count = 0

  def initialize(name,surname,email,address)
    @name=name
    @surname = surname
    @email   = email
    @address = address
    @id      = @@users_count += 1
  end
  def user_data
    @user_data ||={

      name:    @name,
      surname: @surname,
      email:   @email,
      address: @address

    }
  end

  def users_count
    @@users_count
  end


  def self.users_count
    @@users_count
  end

  def self.users_count=(value)
    @@users_count = value
  end


end

#/////////////////////////////////
class Monkey
  def initialize(height, weight)
    @height = height
    @weight = weight
  end

  def self.attr_accessor(*args)
    args.each do |accessor|
      define_method accessor do
        instance_variable_get "@#{accessor}"
      end
      define_method "#{accessor}=" do |value|
        instance_variable_set "@#{accessor}", value
      end
    end
  end

  attr_accessor :height, :weight
end
m = Monkey.new(120,100)
puts m.height #=> 120
puts m.height = 160
puts m.height #=> 160
puts m.instance_variables
puts m.class.superclass.superclass

