<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjetoP2PrecoCombustivel.Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
    <script type="text/javascript">
        function MostrarPopupMensagem() {
            $("#modalMsg").modal('show');
        }
        function EsconderPopupDados() {
            $("#modalDados").modal('hide');
        }
    </script>
    <!-- /.modal -->
    <div class="modal fade" id="modalMsg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <h4 class="modal-title" id="h1" runat="server">Modal title</h4>
                </div>
                <div class="modal-body">
                    <p>
                        <label id="lblMsgPopup" runat="server">
                        </label>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Ok</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
   <h4>Etanol</h4>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" >
        <Series>
            <asp:Series Name="Series1" XValueMember="id_estado" YValueMembers="valorEtanol">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
         <h4>Gasolina</h4>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_valor_combustivelConnectionString2 %>" SelectCommand="SELECT * FROM [TB_ESTADO_COMBUSTIVEL]"></asp:SqlDataSource>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" >
            <Series>
                <asp:Series Name="Series1" XValueMember="id_estado" YValueMembers="valorGasolina">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
</form>
</asp:Content>
