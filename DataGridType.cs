using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace clients
{
    internal class DataGridType
    {
        public String? Date { get; set; }
        public String? Time { get; set; }
        public DataGridType(DateTime dt)
        {

            this.Date = DateOnly.FromDateTime(dt).ToString();
            this.Time = TimeOnly.FromDateTime(dt).ToString();
        }
    }
}
