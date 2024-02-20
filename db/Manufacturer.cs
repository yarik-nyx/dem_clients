﻿using System;
using System.Collections.Generic;

namespace clients.db;

public partial class Manufacturer
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateOnly? Startdate { get; set; }

    public virtual ICollection<Product> Products { get; } = new List<Product>();
}
