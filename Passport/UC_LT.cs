using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
        public bool dlt = true;
        public bool hsl = true;
        private void guna2DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Kiểm tra xem sự kiện được kích hoạt bởi ô chứa nút
            if (dgv_lt.Columns[3].Name == "save")
            {
                DataGridViewCell cell = dgv_lt.Rows[e.RowIndex].Cells[1];              
                try
                {
                    using (SqlConnection conn = new SqlConnection(Main.connectionString))
                    {
                        conn.Open();
                        string query = "select * from Form_Register where shs = @so";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            string tmp = cell.Value.ToString();
                            string value = "";
                            for (int i = tmp.Length - 1; i >= 0; --i)
                            {
                                if ((tmp[i] != ' ')) value += tmp[i];
                                else break;
                            }
                            tmp = value;

                            value = "";
                            for (int i = tmp.Length - 1; i >= 0; --i)
                            {
                                value += tmp[i];
                            }
                            cmd.Parameters.AddWithValue("@so", decimal.Parse(value));
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string so = reader["shs"].ToString();

                                    string hoten = (string)reader["hoten"];
                                    string dc = (string)reader["diachi"];
                                    bool gt = (bool)reader["gioitinh"];
                                    DateTime dt = (DateTime)reader["ngaysinh"];
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
                                        int rowsAffected = cmd_insert.ExecuteNonQuery();

                                        if (rowsAffected > 0)
                                        {
                                            query = "update Form_Register set trave = 1 where shs = @so";
                                            using (SqlCommand cmd_update = new SqlCommand(query, conn))
                                            {
                                                cmd_update.Parameters.AddWithValue("@so", so);
                                                rowsAffected = cmd_update.ExecuteNonQuery();
                                                if (rowsAffected > 0)
                                                {
                                                    MessageBox.Show("Lưu hồ sơ thành công!");
                                                    Load_Data();
                                                }
                                                else
                                                {
                                                    MessageBox.Show("Lưu hồ sơ thất bại!");
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
            try
            {
                using (SqlConnection conn = new SqlConnection(Main.connectionString))
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

        private void btn_Click(object sender, EventArgs e)
        {
            dlt = !dlt;
            hsl = !hsl;
            if (dlt)
            {
                btn_dlt.FillColor = Color.FromArgb(255, 73, 102);
                btn_dlt.HoverState.FillColor = Color.FromArgb(255, 73, 102);
                btn_dlt.HoverState.BorderColor = Color.FromArgb(255, 73, 102);
            }
            else
            {
                btn_dlt.FillColor = Color.FromArgb(94, 148, 255);
                btn_dlt.HoverState.FillColor = Color.FromArgb(94, 148, 255);
                btn_dlt.HoverState.BorderColor = Color.FromArgb(94, 148, 255);
            }

            if (hsl)
            {
                btn_hsl.FillColor = Color.FromArgb(255, 73, 102);
                btn_hsl.HoverState.FillColor = Color.FromArgb(255, 73, 102);
                btn_hsl.HoverState.BorderColor = Color.FromArgb(255, 73, 102);
            }
            else
            {
                btn_hsl.FillColor = Color.FromArgb(94, 148, 255);
                btn_hsl.HoverState.FillColor = Color.FromArgb(94, 148, 255);
                btn_hsl.HoverState.BorderColor = Color.FromArgb(94, 148, 255);
            }
        }

    }
}
