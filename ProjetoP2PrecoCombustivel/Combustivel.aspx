<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Combustivel.aspx.cs" Inherits="ProjetoP2PrecoCombustivel.Combustivel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <html>
    <body>
        <div>
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
            <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
            <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>

            <form id="form1" runat="server">
                <article class="kanban-entry grab" id="item1" draggable="true">
                    <div class="kanban-entry-inner">
                        <div class="kanban-label">
                            <h2><a href="#" style="padding:12px">Cadastro Valor Combustivel</a> <span></span></h2>
                            <p></p>
                        </div>
                    </div>
                </article>
                <div class="form-group col-md-5">
                    <label for="descricao">Informe o ID do estado</label>
                    <asp:TextBox class="form-control" ID="TxtIDEstado"
                        runat="server" placeholder="Informe o ID do estado"></asp:TextBox>
                </div>
                <div class="form-group col-md-5">
                    <label for="descricao">Informe o valor do alcool</label>
                    <asp:TextBox class="form-control" ID="txtValorAlcool"
                        runat="server" placeholder="Informe o valor do alcool"></asp:TextBox>
                </div>
                <div class="form-group col-md-5">
                    <label for="descricao">Informe o valor da gasolina</label>
                    <asp:TextBox class="form-control" ID="TxtValorGasolina"
                        runat="server" placeholder="Informe o valor da gasolina"></asp:TextBox>
                </div>
                <div class="form-group col-md-5" style="padding:22px"> 
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
            </form>
        </div>

    </body>
    </html>
</asp:Content>
