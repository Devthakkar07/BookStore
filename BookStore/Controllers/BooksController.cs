using BookStore.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookStore.Controllers
{
    public class BooksController : Controller
    {
        private readonly ApplicationDbContext _context;

        // Constructor Injection (Production standard)
        public BooksController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: /Books
        public async Task<IActionResult> Index()
        {
            var books = await _context.Books
                                      .Where(b => b.IsActive)
                                      .OrderByDescending(b => b.Id)
                                      .ToListAsync();

            return View(books);
        }
    }
}
