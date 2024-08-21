class ItemsController <

  def index
    @items = Item.includes(:user)
  end
end
