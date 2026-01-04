using Microsoft.EntityFrameworkCore;
using BookStore.Models;

namespace BookStore.Data
{
    public class ApplicationDbContext : DbContext
    {
        // Constructor – REQUIRED
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // DbSet = Table
        public DbSet<Book> Books { get; set; }

        // Optional: Fluent API (Production-level)
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Book>(entity =>
            {
                entity.ToTable("Books");

                entity.HasKey(e => e.Id);

                entity.Property(e => e.Title)
                      .IsRequired()
                      .HasMaxLength(200);

                entity.Property(e => e.Author)
                      .IsRequired()
                      .HasMaxLength(150);

                entity.Property(e => e.Price)
                      .HasColumnType("decimal(10,2)");

                entity.Property(e => e.IsActive)
                      .HasDefaultValue(true);
            });
        }
    }
}
