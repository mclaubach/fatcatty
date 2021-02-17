atom_feed do |feed|
  feed.title(@title)

  feed.updated(@updated)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(h(post.title))
      entry.body
      entry.updated(post.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      end
    end
  end