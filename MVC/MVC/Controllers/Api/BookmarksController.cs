using ReadLater.Data;
using ReadLater.Entities;
using ReadLater.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Routing.Constraints;

namespace MVC.Controllers.Api
{
    public class BookmarksController : ApiController
    {
        private ReadLaterDataContext _context;
    
        public BookmarksController()
        {
            _context = new ReadLaterDataContext();
        }

        // GET /api/bookmarks
        public IEnumerable<Bookmark> GetBookmarks()
        {
            return _context.Bookmarks.ToList();
        }

        // GET /api/bookmarks/1
        public Bookmark GetBookmark(int id)
        {
            var bookmark = _context.Bookmarks.SingleOrDefault(b => b.ID == id);

            if (bookmark == null)
                throw new HttpResponseException(HttpStatusCode.NotFound);

            return bookmark;
        }

        // POST /api/bookmarks
        [HttpPost]
        public Bookmark CreateBookmark(Bookmark bookmark)
        {
            if (!ModelState.IsValid)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            _context.Bookmarks.Add(bookmark);
            _context.SaveChanges();

            return bookmark;
        }

        // PUT /api/bookmarks/1
        [HttpPut]
        public void UpdateBookmark(int id, Bookmark bookmark)
        {
            if (!ModelState.IsValid)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            var bookmarkInDb = _context.Bookmarks.SingleOrDefault(b => b.ID == id);

            if (bookmarkInDb == null)
                throw new HttpResponseException(HttpStatusCode.NotFound);

            bookmarkInDb.URL = bookmark.URL;
            bookmarkInDb.ShortDescription = bookmark.ShortDescription;
            bookmarkInDb.CategoryId = bookmark.CategoryId;

            _context.SaveChanges();
        }

        // DELETE /api/bookmarks/1
        [HttpDelete]
        public void DeleteBookmark(int id)
        {
            var bookmarkInDb = _context.Bookmarks.SingleOrDefault(b => b.ID == id);

            if (bookmarkInDb == null)
                throw new HttpResponseException(HttpStatusCode.NotFound);

            _context.Bookmarks.Remove(bookmarkInDb);
            _context.SaveChanges();
        }
    }
}
