using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Passport
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }
      
        public static string username = "";
        public static string pass = "";
        public static string bp = "";


        private void btn_quit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            username = txt_user.Text;
            pass = txt_pass.Text;
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + username + ";Password=" + pass;

            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("select bophan from Nhanvien where tendn = @username", conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);  
                    using(SqlDataReader  reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            bp = (string)reader["bophan"];
                            reader.Close();
                        }
                    }
                }
                conn.Close();
                Main main = new Main();
                main.Show();
                this.Hide();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
