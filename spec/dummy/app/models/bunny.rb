
class Bunny
  include ActiveModel::Model

  attr_accessor :name, :fluffiness

  def attributes=(params)
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end
end
