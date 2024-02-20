using Avalonia;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using clients.db;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;

namespace clients;

public partial class EditAddClient : Window
{
    public EditAddClient()
    {
        InitializeComponent();
        SaveClickEvent();
        BoxId.IsVisible = false;
        BlockId.IsVisible = false;
        action.Text = "Добавление";
        this.Title = "Добавление клиента";
    }

    public EditAddClient(int id)
    {
        InitializeComponent();
        EditClickEvent();
        LoadClient(id);
        this.Title = "Редактирование клиента";

    }

    public void LoadClient(int id) 
    {
        Client client = Helper.db.Clients.Find(id);
        MyList cl = new MyList()
        {
            Id = client.Id,
            Firstname = client.Firstname,
            Lastname = client.Lastname,
            Patronymic = client.Patronymic,
            Birthday = client.Birthday,
            BirthdayString = client.Birthday.Value.ToShortDateString(),
            Registrationdate = client.Registrationdate,
            Email = client.Email.Trim(),
            Phone = client.Phone.Trim(),
            Gendercode = client.Gendercode,
            Photopath = client.Photopath,
        };
        BoxGender.SelectedIndex = cl.Gender == "ж" ? 0 : 1;
        action.Text = "Редактирование";
        BoxId.IsReadOnly = true;
        DataContext = cl;
    }

    public void SaveClickEvent() {
        SaveEditB.Click += Save_Click;
        LoadPic.Click += AddImageButton_Click;
    }

    private async void Save_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        Err.Text = "";
        Client newClient = new Client();
        

        if (CheckName(BoxName.Text) && CheckName(BoxLastName.Text) && CheckName(BoxPatr.Text))
        {
            newClient.Firstname = BoxName.Text;
            newClient.Lastname = BoxLastName.Text;
            newClient.Patronymic = BoxPatr.Text;
        }
        else
        {
            Err.Text = "FIO is not valid.";
            return;
        }

        if (CheckEmail(BoxIEmail.Text))
        {
            newClient.Email = BoxIEmail.Text;
        }
        else
        {
            Err.Text = "Email is not valid.";
            return;
        }

        if (CheckPhone(BoxPhone.Text))
        {
            newClient.Phone = BoxPhone.Text;
        }
        else
        {
            Err.Text = "Phone is not valid.";
            return;
        }

        newClient.Gendercode = BoxGender.SelectedIndex == 0 ? Convert.ToChar(49) : Convert.ToChar(50);
        newClient.Birthday = DateOnly.FromDateTime(BoxBirthDay.SelectedDate.Value.DateTime);
        await Helper.db.Clients.AddAsync(newClient);
        await Helper.db.SaveChangesAsync();
        this.Close();

    }

    public void EditClickEvent() {
        SaveEditB.Click += Edit_Click;
        LoadPic.Click += AddImageButton_Click;
    }
    public bool CheckName(string str) {
        if (!string.IsNullOrEmpty(str) && (str.All(c => char.IsLetter(c) || char.IsWhiteSpace(c))))
        {
            return true;
        }
        else {
            return false;
        }
    }
    public bool CheckPhone(string str)
    {
        if (!string.IsNullOrEmpty(str) && (str.All(c => char.IsNumber(c) || char.IsWhiteSpace(c)) || str.Contains("(") || str.Contains(")") || str.Contains("-")))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private readonly FileDialogFilter fileDialogFilter = new FileDialogFilter()
    {
        Extensions = new List<String>() { "png", "jpg", "jpeg" },
        Name = "Image Files"
    };

    private async void AddImageButton_Click(object? sender, RoutedEventArgs e)
    {
        OpenFileDialog ofd = new OpenFileDialog();
        ofd.Filters?.Add(fileDialogFilter);

        string[]? result = await ofd.ShowAsync(this);
        if (result == null)
            return;
        string imageName = Path.GetFileName(result[0]);
        File.Copy(result[0], $"./Clients/{imageName}", true);
        BoxImg.Text = $"/Clients/{imageName}";
    }

    public bool CheckEmail(string str) 
    {
        if (!string.IsNullOrEmpty(str) && (str.Contains("@") && str.Contains(".")))
        {
            return true;
        }
        else 
        {
            return false;
        }
    }
    private async void Edit_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        Err.Text = "";
        Client client = await Helper.db.Clients.FindAsync((DataContext as MyList).Id);

        if (CheckName(BoxName.Text) && CheckName(BoxLastName.Text) && CheckName(BoxPatr.Text)) {
            client.Firstname = BoxName.Text;
            client.Lastname = BoxLastName.Text;
            client.Patronymic = BoxPatr.Text;
        } else {
            Err.Text = "FIO is not valid.";
            return;
        }

        if (CheckEmail(BoxIEmail.Text))
        {
            client.Email = BoxIEmail.Text;
        }
        else 
        {
            Err.Text = "Email is not valid.";
            return;
        }

        if (CheckPhone(BoxPhone.Text))
        {    
            client.Phone = BoxPhone.Text;
        }
        else
        {
            Err.Text = "Phone is not valid.";
            return;
        }

        client.Photopath = BoxImg.Text ?? null;
        client.Gendercode = BoxGender.SelectedIndex == 0 ? Convert.ToChar(49) : Convert.ToChar(50);
        client.Birthday = DateOnly.FromDateTime(BoxBirthDay.SelectedDate.Value.DateTime);
        await Helper.db.SaveChangesAsync();
        this.Close();
    }
}