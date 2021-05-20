class NewsEventsInfo {
  final String newsImageURL;
  final String newsTitle;
  final String newsAuthor;
  final String newsDate;
  final Function() onItemTap;

  NewsEventsInfo(this.newsImageURL, this.newsTitle, this.newsAuthor,
      this.newsDate, this.onItemTap);
}
