namespace Passport
{
    partial class UC_Rules
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UC_Rules));
            label1 = new Label();
            Header1 = new Label();
            label2 = new Label();
            label5 = new Label();
            label6 = new Label();
            label13 = new Label();
            label14 = new Label();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("VNF-Comic Sans", 19.8000011F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(158, 12);
            label1.Name = "label1";
            label1.Size = new Size(383, 48);
            label1.TabIndex = 0;
            label1.Text = "Quy định cấp hộ chiếu";
            // 
            // Header1
            // 
            Header1.AutoSize = true;
            Header1.Font = new Font("VNF-Comic Sans", 16.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Header1.Location = new Point(28, 71);
            Header1.Name = "Header1";
            Header1.Size = new Size(159, 40);
            Header1.TabIndex = 2;
            Header1.Text = "Đối tượng:";
            // 
            // label2
            // 
            label2.Font = new Font("VNF-Comic Sans", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label2.Location = new Point(97, 111);
            label2.Name = "label2";
            label2.Size = new Size(589, 87);
            label2.TabIndex = 3;
            label2.Text = "Là Công dân Việt Nam.\r\nNgười Việt Nam định cư nước ngoài(có hộ chiếu nước ngoài)";
            // 
            // label5
            // 
            label5.Font = new Font("VNF-Comic Sans", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label5.Location = new Point(97, 233);
            label5.Name = "label5";
            label5.Size = new Size(589, 259);
            label5.TabIndex = 6;
            label5.Text = resources.GetString("label5.Text");
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Font = new Font("VNF-Comic Sans", 16.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label6.Location = new Point(28, 187);
            label6.Name = "label6";
            label6.Size = new Size(104, 40);
            label6.TabIndex = 5;
            label6.Text = "Hồ sơ:";
            // 
            // label13
            // 
            label13.AutoSize = true;
            label13.Font = new Font("VNF-Comic Sans", 12F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label13.Location = new Point(97, 522);
            label13.MaximumSize = new Size(500, 0);
            label13.Name = "label13";
            label13.Size = new Size(490, 87);
            label13.TabIndex = 15;
            label13.Text = "Trường hợp hồ sơ không đầy đủ, thiếu sót hoặc không đúng quy định sẽ được trả lại để bổ sung hoặc hoàn chỉnh.";
            // 
            // label14
            // 
            label14.AutoSize = true;
            label14.Font = new Font("VNF-Comic Sans", 16.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label14.Location = new Point(28, 481);
            label14.Name = "label14";
            label14.Size = new Size(96, 40);
            label14.TabIndex = 14;
            label14.Text = "Lưu ý:";
            // 
            // UC_Rules
            // 
            AutoScaleMode = AutoScaleMode.None;
            BackColor = Color.FromArgb(247, 247, 239);
            Controls.Add(label13);
            Controls.Add(label14);
            Controls.Add(label5);
            Controls.Add(label6);
            Controls.Add(label2);
            Controls.Add(Header1);
            Controls.Add(label1);
            Name = "UC_Rules";
            Size = new Size(700, 624);
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label Header1;
        private Label label2;
        private Label label5;
        private Label label6;
        private Label label13;
        private Label label14;
    }
}
