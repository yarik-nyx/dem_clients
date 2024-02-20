using System;
using System.Collections.Generic;

namespace clients.db;

public partial class Product
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public decimal Cost { get; set; }

    public string? Description { get; set; }

    public string? Mainimagepath { get; set; }

    public short Isactive { get; set; }

    public int? Manufacturerid { get; set; }

    public virtual Manufacturer? Manufacturer { get; set; }

    public virtual ICollection<Productphoto> Productphotos { get; } = new List<Productphoto>();

    public virtual ICollection<Productsale> Productsales { get; } = new List<Productsale>();

    public virtual ICollection<Product> Attachedproducts { get; } = new List<Product>();

    public virtual ICollection<Product> Mainproducts { get; } = new List<Product>();
}
