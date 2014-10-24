module TwitterCli
  class Controller

    def self.parse(input)
      case input
        # when input is just one word
        when /^([a-zA-Z]+)$/
          name = $1.to_s
          user = TwitterCli::User.users.detect { |user| user.name == name } || TwitterCli::User.new(name)
          user.timeline

        # when input is of format [name] -> [message]
        when /^(\w+)(\s->\s)([\w|\W\s|!?]+)$/
          name = $1.to_s
          message = $3.to_s
          user = TwitterCli::User.users.detect { |user| user.name == name } || TwitterCli::User.new(name)
          user.publish(message)
          nil

        # when input is of format [name] follows [name]
        when /^(\w+)(\sfollows\s)([\w|\W\s|!?]+)$/
          follower_name = $1.to_s
          followed_name = $3.to_s
          follower = TwitterCli::User.users.detect { |user| user.name == $1.to_s } || TwitterCli::User.new(follower_name)
          followed = TwitterCli::User.users.detect { |user| user.name == $3.to_s } || TwitterCli::User.new(followed_name)
          follower.follow(followed)
          nil

        # when input is of format [name] wall
        when /^(\w+)(\swall)$/
          name = $1.to_s
          user = TwitterCli::User.users.detect { |user| user.name == name } || TwitterCli::User.new(name)
          user.wall
      end
    end

  end
end
