class CatRentalRequest < ActiveRecord::Base
  validates :start_date, :end_date, presence: true
  validates :cat_id, presence: true

  validates :status,
    presence: true,
    inclusion: {
      in: %w(PENDING DENIED APPROVED),
      message: "%{value} is not a valid status"
    }

  validate :cat_already_rented

  belongs_to :cat

  


  def overlapping_requests
    previous_rentals = CatRentalRequest.where(:cat_id == self.cat_id)

    potential_overlaps = previous_rentals.select do |rental|
      self.start_date < rental.end_date
    end

    overlaps = potential_overlaps.select do |rental|
      self.end_date > rental.start_date
    end

    overlaps
  end

  def overlapping_approved_requests?
    overlapping_requests.any? do |rental|
      rental.status == "APPROVED"
    end
  end

  private
  def cat_already_rented
    if overlapping_approved_requests?
      errors[:cat_id] << "already rented for these dates!"
    end
  end
end
