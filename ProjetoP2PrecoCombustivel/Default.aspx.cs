using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoP2PrecoCombustivel
{
    public partial class Default : System.Web.UI.Page
    {   
        protected void Page_Load(object sender, EventArgs e)
        {
            dadosPlanilha();
        }

        protected void dadosPlanilha()
        {
            var xls = new XLWorkbook(@"DadosCombustivel.xlsx");
            var planilha = xls.Worksheets.First(w => w.Name == "LER");
            var totalLinhas = planilha.Rows().Count();
            // primeira linha é o cabecalho
            for (int l = 2; l <= totalLinhas; l++)
            {
                var idEstado = planilha.Cell($"A{l}").Value.ToString();
                var nomeEstado = planilha.Cell($"B{l}").Value.ToString();
                var valorEtanol = planilha.Cell($"C{l}").Value.ToString();
                var valorGasolina = planilha.Cell($"D{l}").Value.ToString();

                if (idEstado != null && idEstado != "")
                {
                    inserirDadosTBEstado(nomeEstado);
                    inserirDadosTBCombustivel(idEstado, valorEtanol, valorGasolina);
                }
                
            }
           
        }

        protected void inserirDadosTBCombustivel(string estado, string valorE, string valorG)
        {
            TB_ESTADO_COMBUSTIVEL valorCombustivelEstado = new TB_ESTADO_COMBUSTIVEL()
            {
                id_estado = int.Parse(estado),
                valorEtanol = decimal.Parse(valorE),
                valorGasolina = decimal.Parse(valorG)
            };

            db_valor_combustivelEntities contextCombustivel = new db_valor_combustivelEntities();
            contextCombustivel.TB_ESTADO_COMBUSTIVEL.Add(valorCombustivelEstado);
            contextCombustivel.SaveChanges();
        }

        protected void inserirDadosTBEstado(string auxEstado)
        {
            TB_ESTADO estado = new TB_ESTADO()
            {
                nomeEstado = auxEstado,
            };

            db_valor_combustivelEntities contextEstado = new db_valor_combustivelEntities();
            contextEstado.TB_ESTADO.Add(estado);
            contextEstado.SaveChanges();
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }
        protected void GVViagem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
    }
}