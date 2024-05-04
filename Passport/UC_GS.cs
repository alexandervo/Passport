using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Passport
{
    public partial class UC_GS : UserControl
    {
        public UC_GS()
        {
            InitializeComponent();
        }

        public bool check_xt = true;
        public bool check_xd = false;
        public bool check_lt = false;
        private void UC_GS_Load(object sender, EventArgs e)
        {

        }

        private void btn_Click()
        {
            if (check_xt)
            {
                btn_xt.FillColor = Color.FromArgb(255, 73, 102);
                btn_xt.HoverState.FillColor = Color.FromArgb(255, 73, 102);
                btn_xt.HoverState.BorderColor = Color.FromArgb(255, 73, 102);
            }
            else
            {
                btn_xt.FillColor = Color.FromArgb(94, 148, 255);
                btn_xt.HoverState.FillColor = Color.FromArgb(94, 148, 255);
                btn_xt.HoverState.BorderColor = Color.FromArgb(94, 148, 255);
            }

            if (check_xd)
            {
                btn_xd.FillColor = Color.FromArgb(255, 73, 102);
                btn_xd.HoverState.FillColor = Color.FromArgb(255, 73, 102);
                btn_xd.HoverState.BorderColor = Color.FromArgb(255, 73, 102);
            }
            else
            {
                btn_xd.FillColor = Color.FromArgb(94, 148, 255);
                btn_xd.HoverState.FillColor = Color.FromArgb(94, 148, 255);
                btn_xd.HoverState.BorderColor = Color.FromArgb(94, 148, 255);
            }

            if (check_lt)
            {
                btn_lt.FillColor = Color.FromArgb(255, 73, 102);
                btn_lt.HoverState.FillColor = Color.FromArgb(255, 73, 102);
                btn_lt.HoverState.BorderColor = Color.FromArgb(255, 73, 102);
            }
            else
            {
                btn_lt.FillColor = Color.FromArgb(94, 148, 255);
                btn_lt.HoverState.FillColor = Color.FromArgb(94, 148, 255);
                btn_lt.HoverState.BorderColor = Color.FromArgb(94, 148, 255);
            }
        }

        private void btn_xt_Click(object sender, EventArgs e)
        {
            check_xt = true;
            check_xd = false;
            check_lt = false;
            btn_Click();
        }

        private void btn_xd_Click(object sender, EventArgs e)
        {
            check_xt = false;
            check_xd = true;
            check_lt = false;
            btn_Click();
        }

        private void btn_lt_Click(object sender, EventArgs e)
        {
            check_xt = false;
            check_xd = false;
            check_lt = true;
            btn_Click();
        }

        public void Load_Data()
        {
            dgv_gs.Rows.Clear();
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
            try
            {
                using (SqlConnection conn = new SqlConnection(Main.connectionString))
                {
                    conn.Open();
                    string query = "select * from GiamSat where bp = @bp";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        adapter.Fill(ds, "Form_Register");

                        DataTable dataTable = ds.Tables["Form_Register"];
                        // Lấy số lượng hàng trong DataTable
                        int rowCount = dataTable.Rows.Count;

                        // Lặp qua từng DataRow trong DataTable
                        for (int i = 0; i < rowCount; ++i)
                        {
                            DataRow row = dataTable.Rows[i];
                            string so = "Hồ sơ " + row["shs"].ToString();
                          
                            string tt = (bool)row["trangthai"] ? "Đã duyệt" : "Chưa duyệt";
                          

                            // Thêm dữ liệu vào DataGridView
                            dgv_gs.Rows.Add(so, tt);

                        }
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
            }
        }
    }

}
