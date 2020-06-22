using ReadLater.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.Models
{
    public class NewBookmarkViewModel
    {
        public IEnumerable<Category> Categories { get; set; }
        public Bookmark Bookmark { get; set; }
    }
}