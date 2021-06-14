<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Estado.aspx.cs" Inherits="ProjetoP2PrecoCombustivel.Estado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
        <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>

        <form id="form1" runat="server">
            <article class="kanban-entry grab" id="item1" draggable="true">
                <div class="kanban-entry-inner">
                    <div class="kanban-label">
                        <h2><a href="#" style="padding: 12px">Cadastro Estado</a> <span></span></h2>
                        <p></p>
                    </div>
                </div>
            </article>
            <div class="form-group col-md-5">
                <label for="descricao">Informe o nome do estado</label>
                <asp:TextBox class="form-control" ID="TxtNomePosto"
                    runat="server" placeholder="Informe o nome do estado">
                </asp:TextBox>
            </div>
            <div class="form-group col-md-5" style="padding: 22px">
                <asp:Button class="btn btn-primary" ID="btnCadastrar" runat="server" Text="Salvar"
                    OnClick="btnCadastrar_Click" />
                <asp:Button class="btn btn-danger" ID="btnCancelar" runat="server" Text="Cancelar"
                    OnClick="btnCancelar_Click" />
                <br />
                <% if (!String.IsNullOrEmpty(lblmsg.Text))
                    {%>
                <div class="alert alert-success">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label></strong>
                </div>
                <%} %>
            </div>
            <div>
                <asp:GridView ID="GVEstado" runat="server" CellPadding="4" CssClass="table" ForeColor="#333333"
            GridLines="None" AutoGenerateColumns="False" OnRowCommand="GVEstado_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="nomeEstado" HeaderText="ESTADO" />
                <asp:TemplateField HeaderText="Ações">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="btnAlterarMidia" CommandName="ALTERAR"
                            CommandArgument='<%# Eval("Id") %>' CssClass="btn btn btn-info" Text="Alterar" />
                        <asp:LinkButton runat="server" ID="btnExcluirMidia" CommandName="EXCLUIR"
                            CommandArgument='<%# Eval("Id") %>' CssClass="btn btn btn-primary" Text="Excluir" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            </div>
        </form>
    </div>
    
    <!--Parte da tabela com os dados -->
    
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
                        <span aria-
                            hidden="true">&times;</span><span class="sr-only">Close</span></button>

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
    
        
    
</asp:Content>
