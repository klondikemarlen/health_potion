# from flask import Flask
require_relative 'health_potion'

# app = Flask(__name__)
app = HealthPotion.new __FILE__

# @app.route('/')
# def hello_world():
#     return 'Hello, World!'