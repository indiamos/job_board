class Job < ActiveRecord::Base

  validates :title, :description, presence: true

  before_save :titleize_title

  private

  def titleize_title
    self.title = title.titleize
    # ^ identical to
    # self.title = title.titlecase
  end
end
