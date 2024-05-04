using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
    }

}
