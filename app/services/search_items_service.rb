class SearchItemsService
  def self.search(search)
    if search != ""
      search = "%#{search}%"
      Item.find_by_sql(["select * from items where title like ? ", search])
    else
      Item.all
    end
  end
end