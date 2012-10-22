class ArtistsController < InheritedResources::Base
  belongs_to :user, :optional => true

  # has_scope :in_genres, :type => :array
  # has_scope :limit, :default => 10
  # has_scope :in_state
  # has_scope :on_date

  # def index
  #   debugger
  # end

  # protected
  # def collection
  #   # TODO: Remove sort by user_id
  #   @artists ||= end_of_association_chain.order("user_id desc").paginate(:page => params[:page])
  # end
end
