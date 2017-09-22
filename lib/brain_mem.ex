defprotocol ExBf.Memory do
  
  @type m :: any
  @type e :: any

  @spec left(m) :: m
  def left(m)

  @spec right(m) :: m
  def right(m)

  @spec plus(m) :: m
  def plus(m)

  @spec minus(m) :: m
  def minus(m)

  @spec peek(m) :: e
  def peek(m)

  @spec put(m, e) :: m
  def put(m, e)
end
