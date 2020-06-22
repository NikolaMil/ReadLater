using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ReadLater.Data;
using ReadLater.Entities;
using ReadLater.Services;

namespace MVC.Controllers
{
    public class CategoriesController : Controller
    {
        ICategoryService _categoryService;
        IBookmarkService _bookmarkService;
        public CategoriesController(ICategoryService categoryService, IBookmarkService bookmarkService)
        {
            _categoryService = categoryService;
            _bookmarkService = bookmarkService;
        }
        // GET: Categories
        public ActionResult Index()
        {
            List<Category> model = _categoryService.GetCategories();

            if (User.IsInRole("CanManage"))
                return View("Index", model);

            return View("ReadOnly", model);
        }

        // GET: Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = _categoryService.GetCategory((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);

        }

        // GET: Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name")] Category category)
        {
            if (ModelState.IsValid)
            {
                _categoryService.CreateCategory(category);
                return RedirectToAction("Index");
            }

            return View(category);
        }

        // GET: Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = _categoryService.GetCategory((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Categories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name")] Category category)
        {
            if (ModelState.IsValid)
            {
                _categoryService.UpdateCategory(category);
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = _categoryService.GetCategory((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = _categoryService.GetCategory(id);
            _categoryService.DeleteCategory(category);
            return RedirectToAction("Index");
        }

        // GET: Bookmarks/{CategoryName}
        [HttpGet]
        public ActionResult showBookmarks(string Name)
        {
            List<Bookmark> bookmark = _bookmarkService.GetBookmarksFromCategory(Name);
            return View(bookmark);
        }
    }
}
