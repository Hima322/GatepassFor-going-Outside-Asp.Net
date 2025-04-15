<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>index</title>

       <style>
           .center-content {
            text-align: center;
        }
         #logoContainer {
            position: absolute; 
            top: 5px; 
            Left: 10px;
        }
         td {
            text-align: center;
         }
           .center-table {
            margin: 0 auto;
         }
         .center-columns {
            display: flex;
            justify-content: center;
           
        }
          .grid-header {
            border-bottom: 1px solid #000; 
            font-weight: bold;
          }
        .grid-cell {
            border: 1px solid #000000; 
            padding: 5px; 
        }
     </style>
     <script>
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
         };
    </script>

</head>
<body>
  <img src="logo.png" alt="Logo" /><form id="form1" runat="server">
       
       &nbsp;<div class="center-content">
            <h2>
                <asp:Label ID="Label1" runat="server" Text="Item List"></asp:Label>
            </h2>
        </div>
       <div class="center-columns">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"  
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"  
            CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" Width="600px">  
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />  
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />  
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />  
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />  
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#FFF1D4" />  
            <SortedAscendingHeaderStyle BackColor="#B95C30" />  
            <SortedDescendingCellStyle BackColor="#F1E5CE" />  
            <SortedDescendingHeaderStyle BackColor="#93451F" />  
               <Columns>
                    <asp:BoundField DataField="ID" HeaderText="SNO" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                    <asp:BoundField DataField="Item_Name" HeaderText="ITEM NAME " SortExpression="ITEM NAME " />
                    <asp:BoundField DataField="Item_Type" HeaderText="ITEM TYPE" SortExpression="ITEM TYPE" />
             </Columns> 
        </asp:GridView> 
        </div>
    </form>
</body>
</html>
