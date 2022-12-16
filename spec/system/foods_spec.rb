require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')

  subject do
    Food.new(name: 'Chicken', measurement_unit: 'kg', price: 10, quantity: 1, user_id: user.id)
  end
  before { subject.save }

  describe 'index page' do
    it 'I can see the button.' do
      visit foods_path
      page.has_button?('Add Food')
    end
    it 'I can see the food name.' do
      visit foods_path
      page.has_content?('Chicken')
    end
    it 'I can see the food measurement unit.' do
      visit foods_path
      page.has_content?('kg')
    end
    it 'I can see the food price.' do
      visit foods_path
      page.has_content?('10')
    end
    it 'I can see the food quantity.' do
      visit foods_path
      page.has_content?('1')
    end
  end
end
