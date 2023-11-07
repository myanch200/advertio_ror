class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  normalizes :phone_number, with: :phone_number_normalizer

  validates :first_name, :last_name, :phone_country_code, :phone_number, presence: true
  validate :validate_phone_number

  private

  def phone_number_normalizer(value)
    value.gsub(/[^0-9]/, '')
  end

  def validate_phone_number
    return if phone_number.blank?

    phone = "#{phone_country_code}#{phone_number}"
    reg = /\A\+?[0-9]{10,15}\z/
    errors.add(:phone_number, :invalid) unless phone.match?(reg)
    errors.add(:phone_number, :invalid) unless phone.valid?
  end
end
