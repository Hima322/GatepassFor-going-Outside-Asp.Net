using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    string MyConnection = "Data Source=CONTROL-PMAL;Initial Catalog=HIMNSHU;Integrated Security=True;Pooling=False";

    protected void Page_Load(object sender, EventArgs e)
    {

        Show();
    }
    private void Show()
    {
        SqlConnection conn = new SqlConnection(MyConnection);
        SqlCommand cmd = new SqlCommand("select* from IndexTable", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        string itemName = gr.Cells[2].Text;
        string itemType = gr.Cells[3].Text;
        Session["ItemType"] = itemType;
        Session["ItemName"] = itemName;
        Response.Redirect("Default2.aspx");
    }
}