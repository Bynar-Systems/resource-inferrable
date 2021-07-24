require 'rails_helper'

RSpec.describe Dog, type: :model do
  subject { FactoryBot.build(:dog) }
  it { should validate_presence_of :name }
end
