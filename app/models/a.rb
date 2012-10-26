
def my_method
  yield
end
x = "Hello"
my_method {puts "#{x}"}
