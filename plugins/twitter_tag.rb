# Title: Twitter tag for Jekyll
# Authors: Abraao Lourenco http://alourenco.com
# Description: Display a link to a twitter account, along with a follow button and follower count.
#
# Syntax {% twitter [@]twitter_username %}
#
# Examples:
# {% twitter abelourenco %}
# {% twitter @abelourenco %}
#
# Output:
# <a href="http://twitter.com/abelourenco">@abelourenco</a> <a href="http://twitter.com/abelourenco" class="twitter-follow-button" data-show-count="true">Follow</a>
#

module Jekyll

  class TwitterTag < Liquid::Tag
    @tag = nil

    def initialize(tag_name, markup, tokens)
      if markup =~ /(?:@)?(?<username>\S+)/ # Put the twitter username in the "username" captured group
        @tag = { :username => $~["username"] }
      end
      super
    end

    def render(context)
      if @tag
        <<-eos
<a href="http://twitter.com/#{@tag[:username]}">@#{@tag[:username]}</a> <a href="https://twitter.com/#{@tag[:username]}" class="twitter-follow-button" data-show-screen-name="false" data-width="65px" data-show-count="false">Follow</a>
        eos
      else
        "Error processing input, expected syntax: {% twitter [@]twitter_username %}"
      end
    end
  end
end

Liquid::Template.register_tag('twitter', Jekyll::TwitterTag)
