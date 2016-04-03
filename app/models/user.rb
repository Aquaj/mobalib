class User < ActiveRecord::Base
  belongs_to :handicap
  has_many :ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    "#{fname.capitalize} #{lname[0].upcase}."
  end

end
