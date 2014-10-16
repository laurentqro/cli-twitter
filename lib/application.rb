require 'pry-byebug'

require_relative 'models/user'
require_relative 'models/message'
require_relative 'models/subscription'
require_relative 'models/timeline'
require_relative 'models/wall'

# Seed data
alice = User.new('Alice')
bob = User.new('Bob')
charlie = User.new('Charlie')

alice.publish('I love the weather today')
bob.publish('Damn! We lost!')
bob.publish('Good game though.')
charlie.publish('I\'m in New York today! Anyone want to have a coffee?')

charlie.subscribe_to(alice)
charlie.subscribe_to(bob)
