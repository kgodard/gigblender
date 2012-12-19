class ArtistsController < InheritedResources::Base
  belongs_to :user, :optional => true

  has_scope :in_genres, :type => :array
  # has_scope :limit, :default => 10
  has_scope :in_state
  has_scope :on_date
  has_scope :page, :default => 1

  protected
  def collection
    @artists ||= end_of_association_chain.page(params[:page])
  end
end
