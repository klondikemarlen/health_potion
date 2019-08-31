# Health Potion (a.k.a Ruby Flask)

A Ruby implementation of Python's Flask web frameowrk.

But mostly a way for me to try to learn some basic Ruby programming so I don't keep getting stumped by the small things.

## Minimal Example
```ruby
# from flask import Flask
require 'health_potion'

# app = Flask(__name__)
app = HealthPotion.new

# @app.route('/')
# def hello_world():
#     return 'Hello, World!'
app.route '/', :hello_world do
  'Hello, World!'
end

app.run
```
