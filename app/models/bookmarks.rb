class Bookmark < ActiveRecord::Base
    belongs_to :user
    belongs_to :petty_fact


    def save_bookmark
        puts "this is a save bookmark method"
    end
end