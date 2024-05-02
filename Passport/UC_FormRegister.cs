using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace Passport
{
    public partial class UC_FormRegister : UserControl
    {
        public UC_FormRegister()
        {
            InitializeComponent();     
        }
        

        private void View_Register(string shs, string tt, string hoten, string dc, string gt, string ns, string cccd, string sdt, string email)
        {
            lbl_shs.Text = shs;
            lbl_tt.Text = tt;
            if (tt == "Đã duyệt")
            {
                lbl_tt.ForeColor = Color.FromArgb(0, 255, 127);
                btn_duyet.Text = "Đã duyệt";
            }
            else 
            { 
                lbl_tt.ForeColor = Color.FromArgb(255, 73, 102);
                btn_duyet.Text = "Duyệt";
            }
            lbl_hoten.Text = hoten;
            lbl_dc.Text = dc;
            lbl_gt.Text = gt;
            lbl_ns.Text = ns;
            lbl_cccd.Text = cccd;
            lbl_sdt.Text = sdt;
            lbl_email.Text = email;
        }
        public void Connect_Database()
        {
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "select * from Form_Register"; //where trangthai = @trangthai";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        //cmd.Parameters.AddWithValue("@trangthai", "false");
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        adapter.Fill(ds, "Form_Register");

                        DataTable dataTable = ds.Tables["Form_Register"];
                        Main.row = dataTable.Rows.Count;

                        if (Main.stt < Main.row)
                        {
                            DataRow row = dataTable.Rows[Main.stt];
                            string so = row["shs"].ToString();
                            string gt = ((bool)row["gioitinh"]) ? "Nữ" : "Nam";
                            string tt = ((bool)row["trangthai"]) ? "Đã duyệt" : "Chưa duyệt";
                            string ns = ((DateTime)row["ngaysinh"]).ToShortDateString();
                            string hoten = (string)row["hoten"];
                            string diachi = (string)row["diachi"];
                            Main.so_cccd = (string)row["so_cccd"];
                            string sdt = (string)row["sdt"];
                            string email = (string)row["email"];
                            if (so != null) View_Register(so, tt, hoten, diachi, gt, ns, Main.so_cccd, sdt, email);
                            conn.Close();
                        }
                        else
                        {
                            View_Register("???", "???", "???", "???", "???", "???", "???", "???", "???");
                            conn.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
            }
        }
        private void UC_FormRegister_Load(object sender, EventArgs e)
        {
            Connect_Database();
        }
        
        private void btn_duyet_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "select * from Form_Register where so_cccd = @cccd";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@cccd", Main.so_cccd);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            bool currentStatus = (bool)reader["trangthai"];
                            bool newStatus = !currentStatus; 
                            reader.Close();
                            // Update trạng thái
                            string updateQuery = "update Form_Register set trangthai = @newStatus where so_cccd = @cccd";
                            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                            {
                                updateCmd.Parameters.AddWithValue("@newStatus", newStatus);
                                updateCmd.Parameters.AddWithValue("@cccd", Main.so_cccd);
                                int rowsAffected = updateCmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    btn_duyet.Text = (newStatus) ? "Đã duyệt" : "Duyệt";   
                                    conn.Close();
                                    Connect_Database();
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error updating data: " + ex.Message);
            }
        }
    }
}
