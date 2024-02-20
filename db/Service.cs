using System;
using System.Collections.Generic;

namespace clients.db;

public partial class Service
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public decimal Cost { get; set; }

    public int Durationinseconds { get; set; }

    public string? Description { get; set; }

    public double? Discount { get; set; }

    public string? Mainimagepath { get; set; }

    public virtual ICollection<Clientservice> Clientservices { get; } = new List<Clientservice>();

    public virtual ICollection<Servicephoto> Servicephotos { get; } = new List<Servicephoto>();
}
