describe Bookmark do

  describe '.all' do
    it 'connects to the database and shows all of the inputs' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include ('http://www.google.com' )
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')

      expect(bookmark['url']).to include('http://www.testbookmark.com')
      expect(bookmark['title']).to include('Test Bookmark')
    end
  end
end
