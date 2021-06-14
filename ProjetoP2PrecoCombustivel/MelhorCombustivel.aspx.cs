using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoP2PrecoCombustivel
{
    public partial class MelhorCombustivel : System.Web.UI.Page
    {
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            int idEstado = int.Parse(TxtIDEstado.Text);
            string tipoCombustivel2 = TxtTipoCombustivel.Text;

            TB_MELHOR_COMBUSTIVEL_VALOR melhorCombustivelEstado = new TB_MELHOR_COMBUSTIVEL_VALOR()
            {
                id_estado = idEstado,
                tipoCombustivel = tipoCombustivel2
            };

            db_valor_combustivelEntities contextTipoCombustivel = new db_valor_combustivelEntities();

            string valor = Request.QueryString["idItem"];

            if (String.IsNullOrEmpty(valor))
            {
                contextTipoCombustivel.TB_MELHOR_COMBUSTIVEL_VALOR.Add(melhorCombustivelEstado);
                lblmsg.Text = "Registro Inserido!";
                Clear();
            }
            contextTipoCombustivel.SaveChanges();
        }

        private void Clear()
        {
            TxtIDEstado.Text = "";
            TxtTipoCombustivel.Text = "";
            TxtIDEstado.Focus();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clear();
        }

    }
}