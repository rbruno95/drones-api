require "test_helper"

class MedicationTest < ActiveSupport::TestCase
  def setup
    @medication = medications(:valid)
  end

  test 'valid medication' do
    assert @medication.valid?
  end

  test 'invalid name' do
    @medication.name = 'abc@'

    refute @medication.valid?
    assert_not_nil @medication.errors[:name]
  end

  test 'invalid code' do
    @medication.code = 'abcD'

    refute @medication.valid?
    assert_not_nil @medication.errors[:code]
  end

  test 'invalid does not have a drone' do
    @medication.drone = nil

    refute @medication.valid?
    assert_not_nil @medication.errors[:drone_id]
  end
end
