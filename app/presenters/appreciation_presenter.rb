class AppreciationPresenter
  delegate :id, :points, :token, :given, :created_at, :updated_at, :comments, :giver_name, :likes, to: :appreciation

  def initialize(appreciation)
    @appreciation = appreciation
  end

  def appreciation
    @appreciation
  end

  def user
    @appreciation.user
  end
end
