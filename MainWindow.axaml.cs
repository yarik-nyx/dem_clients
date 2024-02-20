using Avalonia.Controls;
using System.Collections.Generic;
using clients.db;
using System.Linq;
using System.Numerics;
using Tmds.DBus.Protocol;
using System;
using Avalonia.Interactivity;
using Avalonia.VisualTree;
using Microsoft.EntityFrameworkCore;

namespace clients
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            SetEvents();
            ComboBoxsLoadData();
            LoadData();
        }
        public void SetEvents() 
        {
            Tbox.TextChanged += Tbox_TextChanged;
            Cbox1.SelectionChanged += Cbox1_SelectionChanged;
            Cbox2.SelectionChanged += Cbox2_SelectionChanged;
            AddClient.Click += AddClient_Click;
            
        }

        private async void AddClient_Click(object? sender, RoutedEventArgs e)
        {
            EditAddClient wn = new EditAddClient();
            await wn.ShowDialog(this);
            LoadData();
        }

        public void ComboBoxsLoadData() 
        {
            List<string> filters = new List<string>();
            filters.Add("Все");
            filters.Add("Фамилия от А до Я");
            filters.Add("Фамилия от Я до А");
            filters.Add("Дата последнего посещения от 0 до 100");
            filters.Add("Дата последнего посещения от 100 до 0");
            filters.Add("Количество посещений от 0 до 100");
            filters.Add("Количество посещений от 100 до 0");
            Cbox1.ItemsSource = filters.ToList();
            Cbox1.SelectedIndex = 0;

            List<string> sorts = new List<string>();
            sorts = Helper.db.Genders.Select(g => g.Name).ToList();
            sorts.Insert(0, "Все");
            Cbox2.ItemsSource = sorts;
            Cbox2.SelectedIndex = 0;
        }

        private async void EditClick_Event(object sender, RoutedEventArgs e)
        {
            int id = (int)(sender as Button).Tag;
            EditAddClient wn = new EditAddClient(id);
            await wn.ShowDialog(this);
            LoadData();
        }
        private async void LastSeenButton_Event(object sender, RoutedEventArgs e)
        {
            int id = (int)(sender as Button).Tag;
            LastSeenWin wn = new LastSeenWin(id);
            await wn.ShowDialog(this);


        }

        private async void DelClick_Event(object sender, RoutedEventArgs e)
        {
            int id = (int)(sender as Button).Tag;
            Helper.db.Clients.Remove(Helper.db.Clients.Find(id));
            await Helper.db.SaveChangesAsync();
            LoadData();
        }
        private void Cbox2_SelectionChanged(object? sender, SelectionChangedEventArgs e)
        {
            LoadData();
        }

        private void Cbox1_SelectionChanged(object? sender, SelectionChangedEventArgs e)
        {
            LoadData();
        }

        private void Tbox_TextChanged(object? sender, TextChangedEventArgs e)
        {
            LoadData();
        }



        public void LoadData() {

            List<Client> clients = new List<Client>();
            clients = Helper.db.Clients.ToList();
            int allcount = clients.Count();

            List<MyList> mylist = new List<MyList>();
            foreach (var client in clients) {
                mylist.Add(new MyList {
                    Id = client.Id,
                    Firstname = client.Firstname,
                    Lastname = client.Lastname,
                    Patronymic = client.Patronymic,
                    Birthday = client.Birthday,
                    Registrationdate = client.Registrationdate,
                    Email = client.Email.Trim(),
                    Phone = client.Phone.Trim(),
                    Gendercode = client.Gendercode,
                    Photopath = client.Photopath,
                    LastSeenCount = Helper.db.Lastseens.Where(x => x.Clientid == client.Id).Count(),
                    LastSeenDate = Helper.db.Lastseens.Where(x => x.Clientid == client.Id).OrderByDescending(x => x.Datetime).Select(x => x.Datetime).FirstOrDefault(),
                    Color = client.Birthday.Value.Month == DateOnly.FromDateTime(DateTime.Today).Month ? "LightSeaGreen" : "Transparent"
                }) ;
            }

            string searchText = Tbox.Text ?? "";
            if (!string.IsNullOrEmpty(searchText)) {
                searchText = searchText.Trim().ToLower();
                mylist = mylist.Where(x => x.Firstname.Trim().ToLower().Contains(searchText) || 
                x.Lastname.Trim().ToLower().Contains(searchText) || 
                x.Patronymic.Trim().ToLower().Contains(searchText) ||
                x.Email.Trim().ToLower().Contains(searchText) ||
                x.Phone.Trim().ToLower().Contains(searchText)).ToList();
            }
            
            if (Cbox2.SelectedIndex != 0) 
            {
                mylist = mylist.Where(x => x.Gendercode.ToString() ==  Cbox2.SelectedIndex.ToString()).ToList();
            }

            switch (Cbox1.SelectedIndex) 
            {
                case 1:
                    mylist = mylist.OrderBy(x => x.Lastname).ToList();
                    break;
                case 2:
                    mylist = mylist.OrderByDescending(x => x.Lastname).ToList();
                    break;
                case 3:
                    mylist = mylist.OrderBy(x => x.LastSeenDate).ToList();
                    break;
                case 4:
                    mylist = mylist.OrderByDescending(x => x.LastSeenDate).ToList();
                    break;
                case 5:
                    mylist = mylist.OrderBy(x => x.LastSeenCount).ToList();
                    break;
                case 6:
                    mylist = mylist.OrderByDescending(x => x.LastSeenCount).ToList();
                    break;

            }


            

            Count.Text = mylist.Count().ToString() + " из " + allcount.ToString();
            Lbox.ItemsSource = mylist.ToList();
        }

    }
}