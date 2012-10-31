class ArtistsController < InheritedResources::Base
  belongs_to :user, :optional => true

  has_scope :in_genres, :type => :array
  # has_scope :limit, :default => 10
  has_scope :in_state
  has_scope :on_date

  protected
  def collection
    @artists ||= end_of_association_chain.includes(:genres, :zipcode)
  end
end
