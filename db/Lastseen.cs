using System;
using System.Collections.Generic;

namespace clients.db;

public partial class Lastseen
{
    public int Id { get; set; }

    public int Clientid { get; set; }

    public DateTime Datetime { get; set; }

    public virtual Client Client { get; set; } = null!;
}
