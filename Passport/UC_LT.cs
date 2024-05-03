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
    public partial class UC_LT : UserControl
    {
        public UC_LT()
        {
            InitializeComponent();
            Load_Data();
        }

        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Kiểm tra xem sự kiện được kích hoạt bởi ô chứa nút
            if (dgv_lt.Columns[3].Name == "save")
            {
                DataGridViewCell cell = dgv_lt.Rows[e.RowIndex].Cells[e.ColumnIndex];
                string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "select * from Form_Register where shs = @so";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@so", cell.Value.ToString());
                            using(SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (!reader.Read())
                                {
                                    int so = (int)reader["shs"];
                                    string hoten = (string)reader["hoten"];
                                    string dc = (string)reader["diachi"];
                                    bool gt = (bool)reader["gioitinh"];
                                    DateOnly dt = (DateOnly)reader["ngaysinh"];
                                    string cccd = (string)reader["so_cccd"];
                                    string sdt = (string)reader["sdt"];
                                    string email = (string)reader["email"];
                                    reader.Close();
                                    query = "insert into Luutru Values(@so, @hoten, @dc, @gt, @dt, @cccd, @sdt, @email)";
                                    using (SqlCommand cmd_insert = new SqlCommand(query, conn))
                                    {
                                        cmd_insert.Parameters.AddWithValue("@so", so);
                                        cmd_insert.Parameters.AddWithValue("@hoten", hoten);
                                        cmd_insert.Parameters.AddWithValue("@dc", dc);
                                        cmd_insert.Parameters.AddWithValue("@gt", gt);
                                        cmd_insert.Parameters.AddWithValue("@dt", dt);
                                        cmd_insert.Parameters.AddWithValue("@cccd", cccd);
                                        cmd_insert.Parameters.AddWithValue("@sdt", sdt);
                                        cmd_insert.Parameters.AddWithValue("@email", email);
                                        int rowsAffected = cmd.ExecuteNonQuery();

                                        if (rowsAffected > 0)
                                        {
                                            query = "update Form_Register set trave = 1 where shs = @so";
                                            using (SqlCommand cmd_update = new SqlCommand(query,conn))
                                            {
                                                cmd_update.Parameters.AddWithValue("@so", so);
                                                rowsAffected = cmd.ExecuteNonQuery();
                                                if (rowsAffected > 0)
                                                {
                                                    MessageBox.Show("Lưu hồ sơ thành công!");
                                                }
                                            }
                                        }
                                    }
                                }
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
        public void Load_Data()
        {
            dgv_lt.Rows.Clear();
            string connectionString = @"Data Source=ALEXANDER\SQLEXPRESS;Initial Catalog=Passport;User Id=" + Login.username + ";Password=" + Login.pass;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "select shs, gioitinh, trangthai, xacthuc, trave from Form_Register where xacthuc = 1 and trave = 0";
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
                            bool gt = (bool)row["gioitinh"];
                            string tt = (bool)row["trangthai"] ? "Đã duyệt" : "Chưa duyệt";
                            Image img = gt ? Properties.Resources.girl1 : Properties.Resources.boy1;

                            // Thêm dữ liệu vào DataGridView
                            dgv_lt.Rows.Add(img, so, tt);

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
