using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
public partial class _Default2 : System.Web.UI.Page
{
    string itemName;
    string itemType;
 //   int Row = 0;
    //bool firstRow = false;
    DataTable selectedData = new DataTable();
    SqlConnection conn = new SqlConnection("Data Source=CONTROL-PMAL;Initial Catalog=HIMNSHU;Integrated Security=True;Pooling=False");
    int LSPValue, USPValue;


    //selectedData.Columns.Add("ITEM NAME");
    protected void Page_Load(object sender, EventArgs e)
    {



        if (Session["ItemName"] != null && Session["ItemType"] != null)
        {
            itemName = Session["ItemName"].ToString();
            itemType = Session["ItemType"].ToString();

        }
    

        

        Chart1.Series["USP"].ChartType = SeriesChartType.Line;
        Chart1.Series["Actual Limit"].ChartType = SeriesChartType.Line;
        Chart1.Series["LSP"].ChartType = SeriesChartType.Line;
        readUSPLSP();
        readcontinueData1();

    }
    public void readUSPLSP()
    {
        SqlConnection conn = new SqlConnection("Data Source=CONTROL-PMAL;Initial Catalog=HIMNSHU;Integrated Security=True;Pooling=False");
        conn.Open();
        String query = ("SELECT * FROM [HIMNSHU].[dbo].[IndexTable] where Item_Name = '" + itemName + "' and Item_Type ='" + itemType + "'");
        SqlCommand comm = new SqlCommand(query, conn);
        SqlDataReader reader = comm.ExecuteReader();
        while (reader.Read())
        {
            USPValue = Convert.ToInt32(reader["UpperLimit"]);
            LSPValue = Convert.ToInt32(reader["LowerLimit"]);
        }
        conn.Close();
    }

    int RowUpdated = 0;
    public void readcontinueData1()
    {
        SqlConnection conn = new SqlConnection("Data Source=CONTROL-PMAL;Initial Catalog=HIMNSHU;Integrated Security=True;Pooling=False");
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from LogTable where Item_Name = '" + itemName + "'and Item_Type ='" + itemType + "'", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        int RowCount = 1;
        while (reader.Read())
        {
            RowCount++;
            if (RowCount >= RowUpdated)
            {
                Single Yaxis = Convert.ToSingle(reader["MonitoredCurrent"]);
                Chart1.Series["Actual Limit"].LegendText = "Actual Limit";
                Chart1.Series["Actual Limit"].Points.Add(Yaxis);
                Chart1.Series["LSP"].Points.Add(LSPValue);
                Chart1.Series["USP"].Points.Add(USPValue);
            }
        }
        RowUpdated = RowCount;
        conn.Close();

        Label2.Text = itemName;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Chart1.Series["Actual Limit"].Points.Clear();
        SqlConnection conn = new SqlConnection("Data Source=CONTROL-PMAL;Initial Catalog=HIMNSHU;Integrated Security=True;Pooling=False");
        conn.Open();
        string itemName = DropDownList1.Text;
        
        string selectedItem = DropDownList1.SelectedValue;
        String query = ("SELECT * FROM [HIMNSHU].[dbo].[IndexTable] where Item_Name = '" + itemName + "'");
        SqlCommand comm = new SqlCommand(query, conn);
        SqlDataReader reader = comm.ExecuteReader();
        bool dataExists = reader.HasRows;
        if (dataExists)
        {
            while (reader.Read())
            {
                USPValue = Convert.ToInt32(reader["UpperLimit"]);
                LSPValue = Convert.ToInt32(reader["LowerLimit"]);
                //lstColumn.Items.Add(new ListItem(itemName)); 
            }
            conn.Close();
            Label2.Text = itemName;
            conn.Open();
            TextBox1.Text = DropDownList1.Text;
           
            DateTime date = new DateTime();
            if (txtDate.Text == "" || txtDate.Text == null)
            {
                string script = "alert(' Insert Date !!!');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
            }
            else
            {

                date = Convert.ToDateTime(txtDate.Text);
                DateTime dt = new DateTime();
               
                dt = date.AddDays(1);
                SqlCommand cmd = new SqlCommand("select * from LogTable where Item_Name = '" + itemName + "' and LogDateTime >='" + date.ToString("yyyy-MM-dd") + "'" +  "and LogDateTime <'" + dt.ToString("yyyy-MM-dd") + "'", conn);  

                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Single Yaxis = Convert.ToSingle(reader["MonitoredCurrent"]);
                    Chart1.Series["Actual Limit"].LegendText = "Actual Limit";
                    Chart1.Series["Actual Limit"].Points.AddY(Yaxis);
                    Chart1.Series["LSP"].Points.Add(LSPValue);
                    Chart1.Series["USP"].Points.Add(USPValue);

                }
                if (!reader.HasRows)
                {
                    string script = "alert(' Date Not matched To Actual Date please Insert Actual Date   !!!');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                }
            }
            reader.Close();
            Label2.Text = itemName;
            string selectedValue = DropDownList1.SelectedValue;
            TextBox1.Text = selectedValue;
     
        }
        else
        {
            string script = "alert(' insert  data in textBox!!!');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
            conn.Close();
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {


    }
               
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
             SqlConnection conn = new SqlConnection("Data Source=CONTROL-PMAL;Initial Catalog=HIMNSHU;Integrated Security=True;Pooling=False");
                conn.Open();
                 string query = "SELECT [Item_Type] FROM [HIMNSHU].[dbo].[indexTable] where Item_Name = '"+TextBox1.Text+"';";
                SqlCommand cmd1 = new SqlCommand(query, conn);
                 SqlDataReader reader = cmd1.ExecuteReader();
                 while (reader.Read())
                 {
                     itemType = reader.GetValue(0).ToString();
                 }
                 reader.Close();
                string qry = "INSERT INTO LogTable (Item_Name,MonitoredCurrent,Item_Type,LogDateTime) VALUES (@Item_Name, @MonitoredCurrent , @Item_Type,@LogDateTime)";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@Item_Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@MonitoredCurrent", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Item_Type",itemType);
                   cmd.Parameters.AddWithValue("@LogDateTime", DateTime.Now);
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    string script = "alert(' Succesfully Add Value!!!');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                }
                else
                {
                    string script = "alert(' Failed !!!');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
                }
            }
      catch (Exception ex)
    {
        string script = "alert('Error:');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", script, true);
    }
  }

    protected void txtDate_TextChanged(object sender, EventArgs e)
    {

    }
}