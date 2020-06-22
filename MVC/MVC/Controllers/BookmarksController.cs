using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MVC.Models;
using ReadLater.Entities;
using ReadLater.Services;

namespace MVC.Controllers
{
    public class BookmarksController : Controller
    {
        IBookmarkService _bookmarkService;
        ICategoryService _categoryService;

        public BookmarksController(IBookmarkService bookmarkService, ICategoryService categoryService)
        {
            _bookmarkService = bookmarkService;
            _categoryService = categoryService;
        }

        public ActionResult New()
        {
            var categories = _categoryService.GetCategories();
            var viewModel = new NewBookmarkViewModel
            {
                Categories = categories
            };

            return View(viewModel);
        }

        // GET: Bookmarks
        public ActionResult Index()
        {
            List<Category> categories = _categoryService.GetCategories();
            List<SelectListItem> category = new List<SelectListItem>();
            foreach (var c in categories)
            {
                category.Add(new SelectListItem
                {
                    Text = c.Name,
                    Value = c.ID.ToString()
                });
            }

            ViewBag.cat = category;

            List<Bookmark> model = _bookmarkService.GetBookmarks();
            if (User.IsInRole("CanManage"))
                return View("Index", model);
                
            return View("ReadOnly", model);
        }

        // GET: Bookmarks/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Bookmarks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Bookmark bookmark)
        {
            if (ModelState.IsValid)
            {
                _bookmarkService.CreateBookmark(bookmark);
                return RedirectToAction("Index");
            }

            return View(bookmark);
        }

        // GET: Bookmarks/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bookmark bookmark = _bookmarkService.GetBookmark((int)id);
            if (bookmark == null)
            {
                return HttpNotFound();
            }
            return View(bookmark);

        }

        // GET: Bookmarks/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bookmark bookmark = _bookmarkService.GetBookmark((int)id);
            if (bookmark == null)
            {
                return HttpNotFound();
            }

            if (ModelState.IsValid)
            {
                _bookmarkService.UpdateBookmark(bookmark);
            }

            return View(bookmark);
        }

        // POST: Bookmarks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        /*[HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,URL,ShortDescription,CategoryId")] Bookmark bookmark)
        {
            if (ModelState.IsValid)
            {
                _bookmarkService.UpdateBookmark(bookmark);
                return RedirectToAction("Index");
            }
            return View(bookmark);
        }*/

        // GET: Bookmarks/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bookmark bookmark = _bookmarkService.GetBookmark((int)id);
            if (bookmark == null)
            {
                return HttpNotFound();
            }
            return View(bookmark);
        }

        // POST: Bookmarks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bookmark bookmark = _bookmarkService.GetBookmark(id);
            _bookmarkService.DeleteBookmark(bookmark);
            return RedirectToAction("Index");
        }
    }
}