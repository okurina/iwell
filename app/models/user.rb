class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :user_name
    validates :department
  end

  validates :password, presence: true, on: :create
  validates :login_num, presence: true, numericality: { message: 'には8桁の半角数字を使用してください' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  validates_format_of :password, with: PASSWORD_REGEX, 
    message: 'には半角英字と半角数字の両方を含めて設定してください', if: :password_required?

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  has_many :items
  has_many :chats
  has_many :likes
  has_many :roles, through: :user_roles
  has_many :order_lists

end
