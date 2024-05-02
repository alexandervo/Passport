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
    public partial class UC_CCCD : UserControl
    {
        public UC_CCCD()
        {
            InitializeComponent();
        }
        private void View_CCCD(string cccd, string hoten, string dc, string gt, string ns, string qt, string qq)
        {
            lbl_cccd.Text = cccd;
            lbl_hoten.Text = hoten;
            lbl_dc.Text = dc;
            lbl_gt.Text = gt;
            pb_avatar.Image = (gt == "Nam") ? Properties.Resources.boy1 : Properties.Resources.girl1;
            lbl_ns.Text = ns;
            lbl_qt.Text = qt;
            lbl_qq.Text = qq;
        }
        private void UC_CCCD_Load(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "select * from Resident_data where so_cccd = @so_cccd";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@so_cccd", Main.so_cccd);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {                           
                                string gt = ((bool)reader["gioitinh"] == false) ? "Nam" : "Nữ";
                               
                                DateTime dt = (DateTime)reader["ngaysinh"];
                                string ns = dt.ToShortDateString();
                                View_CCCD((string)reader["so_cccd"], (string)reader["hoten"], (string)reader["diachi"], gt, ns, (string)reader["quoctich"], (string)reader["quequan"]);
                                conn.Close();
                            }
                            else
                            {
                                View_CCCD("???", "???", "???", "???", "???", "???", "???");
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

    }
}
