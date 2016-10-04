class Cat < ActiveRecord::Base
  validates :birth_date, :name, presence: true

  validates :sex,
    length: { maximum: 1 },
    presence: true,
    inclusion: {
      in: ['M', 'F'],
      message: "%{value} is not a valid sex"
    }

  validates :color,
    presence: true,
    inclusion: {
      in: %w(blue green red),
      message: "%{value} is not a valid color"
    }

  def age
    today = Date.today
    birth_date = @birth_date

    ((today - birth_date) / 365).to_i
  end
end
