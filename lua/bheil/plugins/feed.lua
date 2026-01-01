return {
  "neo451/feed.nvim",
  dependencies = {
    "gregorias/coop.nvim",
  },
  cmd = "Feed",
  ---@module 'feed'
  ---@type feed.config
  opts = {
    feeds = {
      feeds = {
        {
          "https://hnrss.org/frontpage",
          name = "Hacker News Frontpage",
          tags = { "tech", "news" }
        },
        {
          "https://www.reddit.com/r/rust.rss",
          name = "Rust Subreddit",
          tags = { "rust", "reddit" }
        },
        {
          "rsshub://github/trending/weekly/any",
          name = "Trending Repos",
          tags = { "trending", "github" }
        },
        {
          "https://awsinsider.net/rss-feeds/news.aspx",
          name = "AWS Insider",
          tags = { "aws", "news" }
        },
        {
          "https://feeds.feedburner.com/AmazonWebServicesBlog",
          name = "AWS Blog",
          tags = { "aws", "news" }
        },
        {
          "https://golangweekly.com/rss/",
          name = "Golang Weekly",
          tags = { "go", "news" }
        },
      }
    }
  }
}
