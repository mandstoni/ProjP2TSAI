using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoP2PrecoCombustivel
{
    public partial class Estado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarLista();
            if (!IsPostBack)
            {
                CarregarDadosPagina();
            }
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            string nomeEstado = TxtNomePosto.Text;

            TB_ESTADO estado = new TB_ESTADO()
            {
                nomeEstado = nomeEstado
            };

            db_valor_combustivelEntities contextEstado = new db_valor_combustivelEntities();

            string valor = Request.QueryString["idItem"];

            if (String.IsNullOrEmpty(valor))
            {
                contextEstado.TB_ESTADO.Add(estado);
                lblmsg.Text = "Registro Inserido!";
                Clear();
            }
            else
            {
                int id = Convert.ToInt32(valor);
                TB_ESTADO alterarEstado = contextEstado.TB_ESTADO.First(c => c.ID == id);
                alterarEstado.nomeEstado = estado.nomeEstado;
                lblmsg.Text = "Registro alterado!";
            }
            
            contextEstado.SaveChanges();
            CarregarLista();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            TxtNomePosto.Text = "";
            TxtNomePosto.Focus();
        }

        private void CarregarLista()
        {
            db_valor_combustivelEntities context = new db_valor_combustivelEntities();
            List<TB_ESTADO> lstEstado = context.TB_ESTADO.ToList<TB_ESTADO>();

            GVEstado.DataSource = lstEstado;
            GVEstado.DataBind();
        }

        private void CarregarDadosPagina()
        {
            string valor = Request.QueryString["idItem"];
            int idItem = 0;

            TB_ESTADO estado = new TB_ESTADO();
            db_valor_combustivelEntities contextEstado = new db_valor_combustivelEntities();

            if (!String.IsNullOrEmpty(valor))
            {
                idItem = Convert.ToInt32(valor);
                estado = contextEstado.TB_ESTADO.First(c => c.ID == idItem);
                TxtNomePosto.Text = estado.nomeEstado;
            }
        }

        protected void GVEstado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idItem = Convert.ToInt32(e.CommandArgument.ToString());
            db_valor_combustivelEntities contextEstado = new db_valor_combustivelEntities();
            TB_ESTADO estado = new TB_ESTADO();

            estado = contextEstado.TB_ESTADO.First(c => c.ID == idItem);

            if (e.CommandName == "ALTERAR")
            {
                Response.Redirect("Estado.aspx?idItem=" + idItem);
            }
            else if (e.CommandName == "EXCLUIR")
            {
                contextEstado.TB_ESTADO.Remove(estado);
                contextEstado.SaveChanges();
                string msg = "Viagem excluida com sucesso!";
                string titulo = "Informacao";
                CarregarLista();
                DisplayAlert(titulo, msg, this);
            }
        }

        public void DisplayAlert(string titulo, string mensagem, System.Web.UI.Page page)
        {
            h1.InnerText = titulo;
            lblMsgPopup.InnerText = mensagem;
            ClientScript.RegisterStartupScript(typeof(Page), Guid.NewGuid().ToString(), "MostrarPopupMensagem();", true);
        }
    }
}