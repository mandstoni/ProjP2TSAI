using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoP2PrecoCombustivel
{
    public partial class Combustivel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            int idEstado = int.Parse(TxtIDEstado.Text);
            decimal valorAlcool = decimal.Parse(txtValorAlcool.Text);
            decimal valorGasolina = decimal.Parse(TxtValorGasolina.Text);
           
            db_valor_combustivelEntities contextCombustivel = new db_valor_combustivelEntities();

            TB_ESTADO_COMBUSTIVEL valorCombustivelEstado = new TB_ESTADO_COMBUSTIVEL()
            {
                //falta o id do estado
                id_estado = idEstado,
                valorEtanol = valorAlcool,
                valorGasolina = valorGasolina,
            };

            string valor = Request.QueryString["idItem"];

            if (String.IsNullOrEmpty(valor))
            {
                contextCombustivel.TB_ESTADO_COMBUSTIVEL.Add(valorCombustivelEstado);
                lblmsg.Text = "Registro Inserido!";
                Clear();
            }
            contextCombustivel.SaveChanges();
        }

        private void Clear()
        {
            TxtIDEstado.Text = "";
            txtValorAlcool.Text = "";
            TxtValorGasolina.Text = "";
            TxtIDEstado.Focus();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clear();
        }
      
    }
}