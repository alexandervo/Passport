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
using System.Net;

namespace Passport
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }
        // bộ biến dữ liệu của nhân viên dùng xuyên suốt trong các form sau khi đăng nhập
        public static string username = "";
        public static string pass = "";
        public static string bp = "";
        public static string sql_server_name = "MARCO-A315";
        public bool hide = true;

        // nút thoát 
        private void btn_quit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        public void login()
        {
            // Lấy thông tin đăng nhập từ ô nhập
            username = txt_user.Text;
            pass = txt_pass.Text;
            string connectionString = @"Data Source=" + sql_server_name + ";Initial Catalog=Passport;User Id=" + username + ";Password=" + pass;

            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();// nếu kết nối thành công thì tức là thông tin đăng nhập đúng 
                // khúc using này là để lấy tên bộ phận của nhân viên đó 
                using (SqlCommand cmd = new SqlCommand("select bophan from Nhanvien where tendn = @username", conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            bp = (string)reader["bophan"];
                            reader.Close();
                        }
                    }
                }
                // đóng kết nối và mở màn hình làm việc chính 
                conn.Close();
                Main main = new Main();
                main.Show();
                this.Hide();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message); // kết nối ko thành công thì báo lỗi 
            }
        }

        // nút đăng nhập
        private void btn_login_Click(object sender, EventArgs e)
        {
            login();
        }

        private void hide_pw_Click(object sender, EventArgs e)
        {
            hide = !hide;
            if (hide)
            {
                txt_pass.PasswordChar = '*';
                btn_hide_pw.Image = Properties.Resources.hide;
            }
            else
            {
                txt_pass.PasswordChar = '\0';
                btn_hide_pw.Image = Properties.Resources.show_password;
            }
        }

        private void txt_user_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                e.Handled = true; // Ngăn chặn ký tự Enter xuất hiện trong ô nhập liệu

                // Lấy đối tượng TextBox hiện tại
                Guna.UI2.WinForms.Guna2TextBox currentTextBox = sender as Guna.UI2.WinForms.Guna2TextBox;

                // Tìm ô nhập liệu tiếp theo trong tab order
                Control nextControl = GetNextControl(currentTextBox, true);

                if (nextControl != null)
                {
                    nextControl.Focus(); // Di chuyển trỏ tới ô nhập liệu tiếp theo
                }
            }
        }

        private void txt_pass_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                e.Handled = true;
                login();
            }
        }

        private void KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Up || e.KeyCode == Keys.Down)
            {
                e.SuppressKeyPress = true; // Ngăn chặn sự kiện KeyPress xảy ra

                // Lấy đối tượng TextBox hiện tại
                Guna.UI2.WinForms.Guna2TextBox currentTextBox = sender as Guna.UI2.WinForms.Guna2TextBox;

                // Tìm ô nhập liệu tiếp theo dựa trên phím mũi tên được nhấn
                Guna.UI2.WinForms.Guna2TextBox nextTextBox = null;

                if (e.KeyCode == Keys.Up)
                {
                    nextTextBox = GetPreviousTextBox(currentTextBox);
                }
                else if (e.KeyCode == Keys.Down)
                {
                    nextTextBox = GetNextTextBox(currentTextBox);
                }

                if (nextTextBox != null)
                {
                    nextTextBox.Focus(); // Di chuyển trỏ tới ô nhập liệu tiếp theo
                }
            }
        }
        private Guna.UI2.WinForms.Guna2TextBox GetPreviousTextBox(Guna.UI2.WinForms.Guna2TextBox currentTextBox)
        {
            int index = currentTextBox.TabIndex - 1;
            if (index >= 0)
            {
                Control previousControl = GetControlByTabIndex(this, index);
                if (previousControl is Guna.UI2.WinForms.Guna2TextBox)
                {
                    return (Guna.UI2.WinForms.Guna2TextBox)previousControl;
                }
            }
            return null;
        }

        // Phương thức để tìm ô nhập liệu phía sau
        private Guna.UI2.WinForms.Guna2TextBox GetNextTextBox(Guna.UI2.WinForms.Guna2TextBox currentTextBox)
        {
            int index = currentTextBox.TabIndex + 1;
            Control nextControl = GetControlByTabIndex(this, index);
            if (nextControl is Guna.UI2.WinForms.Guna2TextBox)
            {
                return (Guna.UI2.WinForms.Guna2TextBox)nextControl;
            }
            return null;
        }

        // Phương thức để lấy Control dựa trên TabIndex
        private Control GetControlByTabIndex(Control container, int tabIndex)
        {
            foreach (Control control in container.Controls)
            {
                if (control.TabIndex == tabIndex && control.CanFocus)
                {
                    return control;
                }
            }
            return null;
        }


    }
}
