class Object
  def vputs(m="", o=self)
    puts m if o.verbose rescue ""
  end
  def returning(receiver)
    yield receiver
    receiver
  end  
end