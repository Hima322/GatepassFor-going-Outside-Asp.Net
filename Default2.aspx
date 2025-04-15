<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="_Default2" %>  
  
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml"> 

 
<head id="Head1" runat="server">

    <title>Plot Material</title>
     <style>
           .center-content {
            text-align: center;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: blue;
        }
        
      .top-left-image {
  position: absolute;
  top: 5px;
  left: 10px;
  padding: 10px;
}

          #textBoxContainer {
            display: flex;
            justify-content: space-between;
            margin-top: 20px; 
            
        }
            .textBox {
          padding :5px;
          width:200px;
          font-size:30px;

          
          }
               .form-container {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            padding: 20px;
        }

            .center-chart {
          display: flex;
  justify-content: center;
  align-items: center; 
  background-color: white;
  height: 400px;
  width: 450px;
           
        }
     #textBoxContainer_one {
            display: flex;
            justify-content: space-between; 
            margin-top: 20px;
                  
        }
     
         .textBox {
          padding :5px;
          width:200px;
          font-size:30px;

         }
         .footer {
            margin-top: auto; 
            text-align: center;
            padding: 10px;
             font-size:40px;
      
       
        }
        
        .form-row {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-row label {
            margin-right: 10px;
        }
    #container_Two {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start; 
    position: absolute;
    top: 50%;
    right: 0; 
    transform: translate(0, -50%);
   
}

/* Style for individual form elements */
.form-row {
    display: flex;
    justify-content: flex-start; /* Align items (labels and inputs) to the start (left) */
    align-items: center;
    margin-bottom: 10px;
}

.right-label {
    text-align: right;
    margin-right: 10px; /* Adjust as needed */
    width: 150px; /* Adjust as needed */
    font-size: 16px; /* Adjust as needed */
}

.textBox {
    padding: 5px;
    width: 200px; /* Adjust as needed */
    font-size: 14px; /* Adjust as needed */
}
}
        .listBox1 {
    width: 200px;
    font-size: 14px;
    border: 1px solid #ccc;
    padding: 5px;
}
   .right-label {
            text-align: right;
            margin-right: 40px; 
        }
.listBox2 {
    width: 200px;
    font-size: 14px;
    border: 1px solid #ccc;
    padding: 5px;
}
.listBox3 {
    width: 200px;
    font-size: 14px;
    border: 1px solid #ccc;
    padding: 5px;
}
  .chart-and-list-container {
        display: flex;
        align-items: flex-start; /* Align items at the top of the container */
        justify-content: space-between; /* Add space between Chart and ListView */
    }

    /* Style for the container holding the ListView */
    .list-view-container {
        flex: 1; /* Allow the ListView to take remaining width */
        margin-left: 20px; /* Adjust the margin as needed */
    }
</style>
&nbsp;</style><script>
               function changeBackgroundColor() {
                   var colors = ["#3498db", "#2980b9"];
                   var body = document.body;
                   var currentColorIndex = parseInt(body.getAttribute("data-color-index")) || 0;
                   body.style.backgroundColor = colors[currentColorIndex];
                   currentColorIndex = (currentColorIndex + 1) % colors.length;
                   body.setAttribute("data-color-index", currentColorIndex);
               }
               window.onload = function () {
                   changeBackgroundColor();
               }
    </script></head><body><img src="logo.png" alt="Logo" class="top-left-image">
<form id="form1" runat="server">
          
   
        <div id = "container_Two">
        <div class="form-row">
            <label for="itemName" class="right-label">ItemName:</label>&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div class="form-row">
            <label for="MonitoredCurrent" class="right-label">MonitoredCurrent:</label>
               <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
           
        </div>
   
       

        <asp:Button ID="Button2" runat="server" Text="Button" onclick="Button2_Click" />
        </div>
        <div class = "center-chart">
         <h2 class="right-label">
            <asp:Label ID="Label2" runat="server" Text="Item Type"></asp:Label>
        </h2>
    <asp:Chart ID="Chart1" runat="server"  >  
     <Series>  
                    <asp:Series Name="Actual Limit" ChartType="Line"> 
                    </asp:Series> 
                      <asp:Series Name="USP" ChartType="Line"> 
                    </asp:Series> 
                      <asp:Series Name="LSP" ChartType="Line"> 
                    </asp:Series> 
                </Series> 
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1">  
                <AxisY>
                    <MajorGrid Enabled="False" />
                </AxisY>
                <AxisX>
                    <MajorGrid Enabled="False" />
                </AxisX>
            </asp:ChartArea>  
        </ChartAreas>  
    </asp:Chart>
    <div style="position: absolute; top: 0; right: 10px; padding: 10px;">
</div>
<div style="position: absolute; top: 0; right: 10px; padding: 10px;">
</div>
<div style="position: absolute; top: 0; right: 10px; padding: 10px;">
</div>
    </div>
    <div style="position: absolute; top: 0; right: 10px; padding: 10px; height: 76px;">
    </div>
<div id="textBoxContainer">
    &nbsp
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HIMNSHUConnectionString %>" 
        SelectCommand="SELECT [Item_Name] FROM [IndexTable]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server"  Width ="200px"  Height="60px"
        DataSourceID="SqlDataSource1" DataTextField="Item_Name" 
        DataValueField="Item_Name" style="margin-left: 0px">
    </asp:DropDownList>
        <asp:TextBox ID="txtDate" runat="server" type="Date" Width ="200px"  
        Height="60px" ontextchanged="txtDate_TextChanged"></asp:TextBox> 
</div>
           <div  id = "textBoxContainer_one">
           <asp:Button ID="Button1" runat="server" BackColor="#FFF7E7"
        onclick="Button1_Click" Text="Button" value="Refresh"
        style="width: 150px; height: 50px;" /> </div>
               <div class="footer">
                   <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Home</asp:LinkButton>
        </div>
       
    </form>  
    
</body>  
</html> 



