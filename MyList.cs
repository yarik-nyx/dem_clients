using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Avalonia.Media.Imaging;
using System.IO;

namespace clients
{
    internal class MyList
    {
        public int Id { get; set; }

        public string Firstname { get; set; } = null!;

        public string Lastname { get; set; } = null!;

        public string? Patronymic { get; set; }

        public DateOnly? Birthday { get; set; }

        public string? BirthdayString { get; set; }

        public DateTime Registrationdate { get; set; }

        public string? Email { get; set; }

        public string Phone { get; set; } = null!;
        public string Color { get; set; }

        public int? LastSeenCount { get; set; }

        public DateTime? LastSeenDate { get; set; }
        public char Gendercode { get; set; }

        public string Gender {
            get {
                if (Gendercode == '1')
                {
                    return "ж";
                }
                else {
                    return "м";
                }
            }
        }

        public string Photopath { get; set; }


        public Bitmap Logo {
            get
            {
                if (File.Exists($"./{Photopath}"))
                {
                    return new Bitmap($"./{Photopath}");
                }
                else {
                    return new Bitmap($"./Clients/picture.png");
                }
            } 
        }
    }
}
