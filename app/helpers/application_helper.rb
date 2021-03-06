module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end

	def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-success"
      when :info then "alert alert-info"
      when :alert then "alert alert-danger"
      when :warning then "alert alert-warning"
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end

  def conditions_option()
    options = []
    conditions = Condition.all
    conditions.each do |c|
      options.push([c.name, c.id])
    end
    return options
  end

  def categories_option()
    options = []
    categories = Category.all
    categories.each do |c|
      options.push([c.name, c.id])
    end
    return options
  end


  def product_watch(product_id, user_id)
    product = Product.find(product_id)
    product_watch = Watchlist.where product_id: product
    if product_watch.find_by user_id: user_id
      return true
    else
      return false
    end
  end
  
end
