class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_default_type, if: Proc.new { |user| user.type.blank? }

  validates_presence_of :first_name, :last_name
  validates_inclusion_of :type, in: %w[Trainer User]

  has_many :messages

  def set_default_type
    self.type = 'User'
  end
end
