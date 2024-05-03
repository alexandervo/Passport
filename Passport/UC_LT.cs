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
            if (e.RowIndex >= 0 && e.ColumnIndex >= 0 && dgv_lt.Columns[e.ColumnIndex] is DataGridViewButtonColumn)
            {
                // Lấy giá trị của ô được nhấp
                object cellValue = dgv_lt.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;

                // Xử lý tương ứng với ô chứa nút
                if (cellValue != null && cellValue.ToString() == "Chưa lưu") // Thay "ButtonValue" bằng giá trị của nút trong ô
                {
                    //thực hiện insert dữ liệu vào bảng lưu trữ

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
                    string query = "select shs, gioitinh, trangthai, xacthuc, trave from Form_Register where xacthuc = 1";
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
                            dgv_lt.Rows[i].Cells[3].Value = ((bool)row["trangthai"] && (bool)row["xacthuc"] && (bool)row["trave"]) ? "Đã lưu" : "Lưu";
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
