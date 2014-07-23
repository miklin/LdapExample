using System.Windows;

namespace LdapExample
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var users = LdapService.GetUsers(PathTextBox.Text, UserNameTextBox.Text, PasswordTextBox.Text,
                FilterTextBox.Text, NamePathTextBox.Text, SuramePathTextBox.Text, DescriptionPathTextBox.Text,
                GuidPathTextBox.Text, PhotoPathTextBox.Text);

            UsersDataGrid.Items.Clear();
            if (users.Count > 0)
            {
                foreach (var u in users)
                    UsersDataGrid.Items.Add(u);
            }
        }
    }
}
