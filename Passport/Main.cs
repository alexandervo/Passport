using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Data.SqlClient;
using Guna.UI2.WinForms.Suite;
using Passport.Properties;
using System.Resources;

namespace Passport
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
            Menu();
            Arrow_Button();
            if (xt) XT();
            if (xd) XD();

        }
        private Guna.UI2.WinForms.Guna2ImageButton btn_left_arrow;
        private Guna.UI2.WinForms.Guna2ImageButton btn_right_arrow;
        public void Arrow_Button()
        {
            Guna.UI2.WinForms.Suite.CustomizableEdges customizableEdges12 = new Guna.UI2.WinForms.Suite.CustomizableEdges();
            Guna.UI2.WinForms.Suite.CustomizableEdges customizableEdges13 = new Guna.UI2.WinForms.Suite.CustomizableEdges();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            btn_left_arrow = new Guna.UI2.WinForms.Guna2ImageButton();
            btn_right_arrow = new Guna.UI2.WinForms.Guna2ImageButton();
            // 
            // btn_left_arrow
            // 
            btn_left_arrow.CheckedState.ImageSize = new Size(64, 64);
            btn_left_arrow.HoverState.Image = (Image)resources.GetObject("resource.Image");
            btn_left_arrow.HoverState.ImageSize = new Size(64, 64);
            btn_left_arrow.Image = Properties.Resources.left_arrow;
            btn_left_arrow.ImageOffset = new Point(0, 0);
            btn_left_arrow.ImageRotate = 0F;
            btn_left_arrow.Location = new Point(83, 548);
            btn_left_arrow.Name = "btn_left_arrow";
            btn_left_arrow.PressedState.ImageSize = new Size(64, 64);
            btn_left_arrow.ShadowDecoration.CustomizableEdges = customizableEdges12;
            btn_left_arrow.Size = new Size(89, 76);
            btn_left_arrow.TabIndex = 3;
            btn_left_arrow.Click += btn_left_arrow_Click;

            // 
            // btn_right_arrow
            // 
            btn_right_arrow.CheckedState.ImageSize = new Size(64, 64);
            btn_right_arrow.HoverState.Image = (Image)resources.GetObject("resource.Image1");
            btn_right_arrow.HoverState.ImageSize = new Size(64, 64);
            btn_right_arrow.Image = (Image)resources.GetObject("btn_right_arrow.Image");
            btn_right_arrow.ImageOffset = new Point(0, 0);
            btn_right_arrow.ImageRotate = 0F;
            btn_right_arrow.Location = new Point(389, 548);
            btn_right_arrow.Name = "btn_right_arrow";
            btn_right_arrow.PressedState.ImageSize = new Size(64, 64);
            btn_right_arrow.ShadowDecoration.CustomizableEdges = customizableEdges13;
            btn_right_arrow.Size = new Size(89, 76);
            btn_right_arrow.TabIndex = 2;
            btn_right_arrow.Click += btn_right_arrow_Click;

        }
        public bool xt = (Login.bp == "xt") ? true : false;
        public bool xd = (Login.bp == "xd") ? true : false;
        public bool lt = (Login.bp == "lt") ? true : false;
        public bool gs = (Login.bp == "gs") ? true : false;
        public static string so_cccd = "?";
        public static bool left = false;
        public static bool right = false;
        public static int stt = 0;
        public static int row = 0;

        private void panel2_Paint(object sender, PaintEventArgs e)
        {


        }
        // hàm thay đổi thuộc tính của các nút menu theo chức năng bộ phận 
        private void Menu()
        {
            if (xt)
            {
                btn_xt.FillColor = Color.FromArgb(253, 192, 0);
                btn_xt.HoverState.FillColor = Color.FromArgb(253, 192, 0);
                btn_xt.HoverState.BorderColor = Color.FromArgb(253, 192, 0);
            }
            else
            {
                btn_xt.FillColor = Color.FromArgb(53, 45, 125);
                btn_xt.HoverState.FillColor = Color.FromArgb(53, 45, 125);
                btn_xt.HoverState.BorderColor = Color.FromArgb(53, 45, 125);
            }

            if (xd)
            {
                btn_xd.FillColor = Color.FromArgb(253, 192, 0);
                btn_xd.HoverState.FillColor = Color.FromArgb(253, 192, 0);
                btn_xd.HoverState.BorderColor = Color.FromArgb(253, 192, 0);
            }
            else
            {
                btn_xd.FillColor = Color.FromArgb(53, 45, 125);
                btn_xd.HoverState.FillColor = Color.FromArgb(53, 45, 125);
                btn_xd.HoverState.BorderColor = Color.FromArgb(53, 45, 125);
            }

            if (lt)
            {
                btn_lt.FillColor = Color.FromArgb(253, 192, 0);
                btn_lt.HoverState.FillColor = Color.FromArgb(253, 192, 0);
                btn_lt.HoverState.BorderColor = Color.FromArgb(253, 192, 0);
            }
            else
            {
                btn_lt.FillColor = Color.FromArgb(53, 45, 125);
                btn_lt.HoverState.FillColor = Color.FromArgb(53, 45, 125);
                btn_lt.HoverState.BorderColor = Color.FromArgb(53, 45, 125);
            }

            if (gs)
            {
                btn_gs.FillColor = Color.FromArgb(253, 192, 0);
                btn_gs.HoverState.FillColor = Color.FromArgb(253, 192, 0);
                btn_gs.HoverState.BorderColor = Color.FromArgb(253, 192, 0);
            }
            else
            {
                btn_gs.FillColor = Color.FromArgb(53, 45, 125);
                btn_gs.HoverState.FillColor = Color.FromArgb(53, 45, 125);
                btn_gs.HoverState.BorderColor = Color.FromArgb(53, 45, 125);
            }
        }
        // hàm hiện màn hình làm việc của bộ phận xác thực 
        public void XT()
        {
            panel2.Controls.Clear();
            left = false;
            right = false;
            panel2.Controls.Add(btn_left_arrow);
            panel2.Controls.Add(btn_right_arrow);

            // Thêm UserControl UC_FormRegister vào panel2
            UC_FormRegister uC_FormRegister = new UC_FormRegister();
            uC_FormRegister.Location = new Point(0, 0);
            uC_FormRegister.Size = new Size(545, 521);
            panel2.Controls.Add(uC_FormRegister);

            // Thêm UserControl UC_CCCD vào panel2
            UC_CCCD uC_CCCD = new UC_CCCD();
            uC_CCCD.Location = new Point(605, 20);
            uC_CCCD.Size = new Size(706, 491);
            panel2.Controls.Add(uC_CCCD);

        }

        // hàm hiện màn hình làm việc của bộ phận xét duyệt 
        public void XD()
        {
            panel2.Controls.Clear();
            left = false;
            right = false;
            panel2.Controls.Add(btn_left_arrow);
            panel2.Controls.Add(btn_right_arrow);

            // Thêm UserControl UC_FormRegister vào panel2
            UC_FormRegister uC_FormRegister = new UC_FormRegister();
            uC_FormRegister.Location = new Point(0, 0);
            uC_FormRegister.Size = new Size(545, 521);
            panel2.Controls.Add(uC_FormRegister);


        }

        private void Main_Load(object sender, EventArgs e)
        {
            // hiển thị tên của nhân viên hiện tại đăng nhập vào hệ thống 
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "select * from Nhanvien where tendn = @username";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@username", Login.username);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lbl_name.Text = (string)reader["hoten"];
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }


        private void btn_exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
  

        private void btn_right_arrow_Click(object sender, EventArgs e)
        {
            if (stt < row - 1)
            {
                right = true;
                left = false;
                stt++;
                so_cccd = "???";
                if (xt) XT();
                if (xd) XD();
            }

        }

        private void btn_left_arrow_Click(object sender, EventArgs e)
        {
            if (stt > 0)
            {
                left = true;
                right = false;
                stt--;
                so_cccd = "???";
                if (xt) XT();
                if (xd) XD();
            }

        }
    }
}
