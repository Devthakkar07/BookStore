using BookStore.Data;
using BookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace BookStore.Controllers.API
{
    [ApiController]
    [Route("api/books")]
    public class BooksApiController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // ✅ Constructor injection (MANDATORY)
        public BooksApiController(ApplicationDbContext context)
        {
            _context = context;
        }

        // ===============================
        // GET ALL BOOKS
        // ===============================
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var books = await _context.Books
                .FromSqlRaw("EXEC sp_Books_GetAll")
                .ToListAsync();

            return Ok(books);
        }

        // ===============================
        // GET BOOK BY ID
        // ===============================

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            // Execute SP asynchronously
            var books = await _context.Books
                .FromSqlRaw("EXEC sp_Books_GetById @Id", new SqlParameter("@Id", id))
                .ToListAsync(); // run SP and bring results

            var book = books.FirstOrDefault();

            if (book == null)
                return NotFound();

            return Ok(book);
        }




        [HttpPost]
        public async Task<IActionResult> Create(Book model)
        {
            try
            {
                await _context.Database.ExecuteSqlRawAsync(
                    "EXEC sp_Books_Insert @Title,@Author,@Price,@PublishedDate",
                    new SqlParameter("@Title", model.Title),
                    new SqlParameter("@Author", model.Author),
                    new SqlParameter("@Price", model.Price),
                    new SqlParameter("@PublishedDate", model.PublishedDate)
                );

                return Ok(new { success = true, message = "Book created successfully" });
            }
            catch (SqlException ex)
            {
                // Check if error number corresponds to RAISERROR in SP
                // RAISERROR without error number returns 50000
                if (ex.Number == 50000)
                {
                    return BadRequest(new { success = false, message = ex.Message });
                }

                // Other SQL exceptions
                return StatusCode(500, new { success = false, message = "Database error: " + ex.Message });
            }
            catch (Exception ex)
            {
                // Any other errors
                return StatusCode(500, new { success = false, message = "Server error: " + ex.Message });
            }
        }


        // ===============================
        // UPDATE BOOK
        // ===============================
        [HttpPut]
        public async Task<IActionResult> Update(Book model)
        {
            try
            {
                await _context.Database.ExecuteSqlRawAsync(
                    "EXEC sp_Books_Update @Id,@Title,@Author,@Price,@PublishedDate",
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Title", model.Title),
                    new SqlParameter("@Author", model.Author),
                    new SqlParameter("@Price", model.Price),
                    new SqlParameter("@PublishedDate", model.PublishedDate)
                );

                return Ok(new { success = true, message = "Book updated successfully" });
            }
            catch (SqlException ex)
            {
                if (ex.Number == 50000)
                {
                    return BadRequest(new { success = false, message = ex.Message });
                }
                return StatusCode(500, new { success = false, message = "Database error: " + ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Server error: " + ex.Message });
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                // Execute stored procedure to delete book (soft delete)
                await _context.Database.ExecuteSqlRawAsync(
                    "EXEC sp_Books_Delete @Id",
                    new SqlParameter("@Id", id)
                );

                return Ok(new { success = true, message = "Book deleted successfully" });
            }
            catch (SqlException ex)
            {
                return StatusCode(500, new { success = false, message = "Database error: " + ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = "Server error: " + ex.Message });
            }
        }

    }
}
