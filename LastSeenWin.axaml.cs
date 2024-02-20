using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using clients.db;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;

namespace clients;

public partial class LastSeenWin : Window
{
    
    public LastSeenWin()
    {
        InitializeComponent();
    }
    public LastSeenWin(int id)
    {
        InitializeComponent();
        LoadData(id);
    }
    
    public void LoadData(int id) 
    {
        List<DataGridType> lsList = Helper.db.Lastseens.Where(x => x.Clientid == id).Select(y => new DataGridType(y.Datetime)).ToList();
        LboxTime.ItemsSource = lsList;
    }
}