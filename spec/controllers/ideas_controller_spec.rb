require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    def current_user
        @current_user ||= FactoryBot.create :user
    end
end
