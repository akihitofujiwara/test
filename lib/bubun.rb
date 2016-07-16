require "bubun/version"

module Bubun
  def partially_include m, *xs
    __define_methods :define_method, m, *xs
  end

  def partially_extend m, *xs
    __define_methods :define_singleton_method, m, *xs
  end

  def __define_methods type, m, *xs
    (xs[0].instance_of?(Hash) ? xs[0] : xs.flatten).map {|x, y|
      send type, (y || x), m.instance_method(x)
    }
  end
end

class Object
  include Bubun
end

