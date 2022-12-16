require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')

  subject do
    Recipe.new(name: 'Chicken', description: 'Chicken with rice', user_id: user.id)
  end
  before { subject.save }

  describe 'index page' do
    it 'I can see the button.' do
      visit recipes_path
      page.has_button?('Add Recipe')
    end
    it 'I can see the recipe name.' do
      visit recipes_path
      page.has_content?('Chicken')
    end
    it 'I can see the recipe description.' do
      visit recipes_path
      page.has_content?('Chicken with rice')
    end
  end
end
