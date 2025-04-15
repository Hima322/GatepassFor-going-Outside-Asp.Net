<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GatePass-Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../css/libs/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/libs/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/toastify.min.css" />

    <script type="text/javascript" src="../js/libs/toastify-js.js"></script>
    <script type="text/javascript" src="../js/libs/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="../js/libs/jquery.min.js"></script>
    <script type="text/javascript" src="../js/libs/moment.min.js"></script>
    <script type="text/javascript" src="../js/libs/xlsx.full.min.js"></script>

     <style>
         table {
             table-layout: auto !important;
         }

             table thead tr th:first-child {
                 min-width: 10px;
             }

             table thead tr th:nth-child(5) {
                 min-width: 700px;
             }
              table thead tr th:nth-child(4) {
                 min-width: 200px;
             }table thead tr th:nth-child(6) {
                 min-width: 200px;
             }table thead tr th:nth-child(8) {
                 min-width: 200px;
             }table thead tr th:nth-child(36) {
                 min-width: 200px;
             }table thead tr th:nth-child(7) {
                 min-width: 350px;
             }table thead tr th:nth-child(10) {
                 min-width: 320px;
             }table thead tr th:nth-child(12) {
                 min-width: 200px;
             }table thead tr th:nth-child(9) {
                 min-width: 200px;
             }

             table thead tr th:nth-child(9) {
                 min-width: 120px;
             } table thead tr th:nth-child(19) {
                 min-width: 200px;
             } table thead tr th:nth-child(25) {
                 min-width: 200px;
             } table thead tr th:nth-child(28) {
                 min-width: 200px;
             }
     </style>
    <style>
        button.first-active:first-child {
            color: white;
            background: #6c757d;
        }

        button.first-active {
            background: #f8f9fa;
        }

            button.first-active:hover {
                background: #d3d4d5;
            }
        /* width */
        ::-webkit-scrollbar {
            width: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: lightgray;
            border-radius: 10px;
        }
    </style>
    <script>
      
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <%--  <% if (CurrentError != "")
                { %>
            <div id="toast" class="toast <%=CurrentError == "" ? "" : "show" %> bg-white" style="position: fixed; top: 20px; right: 20px; z-index: 999;">
                <div class="d-flex p-2 bg-secondary toast-body text-white">
                    <big class="me-auto ps-2"><%=CurrentError %></big>
                    <button type="button" class="btn-close text-white" data-bs-dismiss="toast"></button>
                </div>
            </div>
            <% } %>--%>


            <%--navbar header--%>
            <div class="navbar navbar-light d-flex px-5" style="background: lightgray;">
                <!--header logo-->
                <img src="image/logo.png" alt="error" height="45" />

                <!--header menu-->
                <div class="d-flex gap-2">

                    <button class="btn btn-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
                        Menu
                        <img src="image/icon/quote.svg" height="20" width="40" />
                    </button>

                    <div class="offcanvas offcanvas-end" id="demo">
                        <div class="offcanvas-header">
                            &nbsp;
                            <button class="btn btn-outline-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
                                Close
                                <img src="image/icon/x.svg" />
                            </button>
                        </div>l
                        <div class="offcanvas-body px-5 text-center">
                            <%-- <button class="btn btn-outline-secondary mb-3" type="button" onclick="location.href = '/station/print.aspx'">Print Qr</button>--%>
                            <button class="btn btn-outline-secondary mb-3" type="button" onclick="location.href = '/report/index.aspx'">Getpass_Report</button> 
                           
                             <button class="btn btn-outline-secondary mb-3" type="button" onclick="location.href = '/variant/GatePass.aspx'">TAKE_GATEPASS</button> 

                        </div>
                        <div class="offcanvas-footer">
                            <p class="text-center">
                                &copy; Pioneer Machine & Automation Pvt Ltd
                                <script>document.write(new Date().getFullYear())</script>
                                .
                            </p>
                        </div>
                    </div>

                </div>
            </div>


            <%--body part code--%>
            <div class="container-fluid px-5 mt-3">

                <%--search js--%>
                <script>
                    $(document).ready(function () {
                        $("#search_box").on("keyup", function () {
                            var value = $(this).val().toLowerCase().trim();
                            $("#filter_data tr").filter(function () {
                                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                            });
                        });
                        setInterval(() => {
                           handleShowModelReportYFG();
                        }, 100);
                    });
                    const toast = txt =>

                        Toastify({
                            text: txt,
                            duration: 5000,
                            gravity: "bottom",
                            position: "right",
                            style: {
                                background: 'lightgray',
                                color: 'black',
                                fontSize: '20px',
                                fontWeight: 600,
                                borderRadius: '5px'
                            }
                        }).showToast();
                </script>


                <%--model details table--%>
               <%--body content--%>
            <div class="container ">
                <div class="tab-content">

            
                </div>

            </div>


            <div class="container-fluid px-4 mt-4 table-responsive">
                <%--code for show reported data--%>

                <table id="table" class="table text-center table-sm table-bordered table-striped " style="width: 100%">
                    <thead class="table-secondary">
                   
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
            <!--Code for Add new Modal popup -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog" style="width: 400px !important;">
                    <div class="modal-content pb-2">

                        <!-- Modal body -->
                        <div class="modal-body form-container">
                            <%--show error during add model--%>
                            <div id="show_error"></div>
                            <!--model add form-->
                            <div class="d-flex justify-content-center gap-3 mb-2">
                                <div>
                                    <label for="model" class="form-label"><b>Model name:</b></label>
                                    <input id="model_name_input" class="form-control" />
                                </div>
                                <div>
                                    <label for="model" class="form-label"><b>Customer name:</b></label>
                                    <input id="customer_name_input" class="form-control" />
                                </div>
                            </div>
                            <div class="mb-3 ">
                                <label for="partnumber" class="form-label"><b>Part number :</b></label>
                                <input id="part_number_input" class="form-control" />
                            </div>
                            <button type="button" data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>&nbsp;
                                <button onclick="handleAddModel()" class="btn btn-primary" type="button">Submit</button>
                        </div>

                        
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>

        // code for check authentication
        if (localStorage.getItem("admin") == null) {
            location.href = "/login.aspx"
        }

        // Initialize tooltips in bootstraph
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })

        //code for popover 
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl)
        })

        //code for toast auto close  
        if (document.getElementById("toast").classList.value.split(" ").includes("show")) {
            setTimeout(function () {
                document.getElementById("toast").classList.remove("show")
                    <%--<%CurrentError = "";%>--%>
            }, 3000)
        }

    </script>
</body>
</html>

