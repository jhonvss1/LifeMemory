using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void btnAcenderVela_Click(object sender, EventArgs e)
    {
        // Converte o número do span para inteiro
        int velaNumero = int.Parse(lblVelaNumero.InnerText);

        // Incrementa o número
        velaNumero++;

        // Atualiza o valor no span
        lblVelaNumero.InnerText = velaNumero.ToString();
    }
    protected void btnAdicionarVitimaModal_Click(object sender, EventArgs e)
    {
        // Lógica para adicionar vítima
        // Capturar os valores dos campos do modal
        string nomeFalecido = txtNomeFalecido.Value;
        string  dataNascimento = txtDataNascimento.Value;
        string dataFalecimento = txtDataFalecimento.Value;
        string localObito =  txtLocalObito.Value;

        // Criar o objeto de Vítima
        Falecido falecido = new Falecido()
        {
            Nome = nomeFalecido,
            DataNascimento = dataNascimento,
            DataFalecimento = dataFalecimento,
            LocalObito = localObito
        };

        AdicionarFalecido(falecido);

        ScriptManager.RegisterStartupScript(this, this.GetType(), "fecharModal", "$('#adicionarVitima').modal('hide');", true);
        Response.Write("<script>alert('Vítima adicionada com sucesso!');</script>");

        txtNomeFalecido.Value = "";
        txtDataNascimento.Value = "";
        txtDataFalecimento.Value = "";
        txtLocalObito.Value = "";
    }


    protected void btnSalvarPrece_Click(object sender, EventArgs e)
    {
        // Lógica para salvar a prece
        Response.Write("<script>alert('Prece salva com sucesso!');</script>");
    }
    public static string[] NormalizeNames(string[] names)
    {
        int maxLen = names.Max(name => name.Length);
        for (int i = 0; i < names.Length; i++)
            names[i] = names[i].PadRight(maxLen);

        return names;
    }

    public static void CountSort(string[] arr, int n, int charPosition)
    {
        string[] output = new string[n];
        int[] count = new int[256];

        for (int i = 0; i < 256; i++)
            count[i] = 0;

        for (int i = 0; i < n; i++)
            count[arr[i][charPosition]]++;

        for (int i = 1; i < 256; i++)
            count[i] += count[i - 1];

        for (int i = n - 1; i >= 0; i--)
        {
            int charIndex = arr[i][charPosition];
            output[count[charIndex] - 1] = arr[i];
            count[charIndex]--;
        }

        for (int i = 0; i < n; i++)
            arr[i] = output[i];
    }

    public static void RadixSort(string[] arr, int n)
    {
        arr = NormalizeNames(arr);
        int maxLen = arr[0].Length;

        for (int charPosition = maxLen - 1; charPosition >= 0; charPosition--)
            CountSort(arr, n, charPosition);
    }

    public static string[] SortStrings(string[] names)
    {
        for (int i = 0; i < names.Length; i++)
        {
            names[i] = names[i].ToLower();
        }

        RadixSort(names, names.Length);
        return names;
    }

    public static string[] SortDates(string[] dates)
    {
        DateTime[] parsedDates = new DateTime[dates.Length];
        for (int i = 0; i < dates.Length; i++)
        {
            parsedDates[i] = DateTime.Parse(dates[i], CultureInfo.InvariantCulture);
        }

        string[] isoDates = Array.ConvertAll(parsedDates, date => date.ToString("dd-MM-yyyy"));
        RadixSort(isoDates, isoDates.Length);

        return isoDates;
    }

    protected void btnDataObito_Click(object sender, EventArgs e)
    {
        var falecidos = GetFalecidos();
        var ordenadosPorData = falecidos.OrderBy(f => f.DataFalecimento).ToList();
        RenderCards(ordenadosPorData);
    }

    protected void btnOrdemAlfabetica_Click(object sender, EventArgs e)
    {
        var falecidos = GetFalecidos();
        var ordenadosPorNome = falecidos.OrderBy(f => f.Nome).ToList();
        RenderCards(ordenadosPorNome);
    }

    private void RenderCards(List<Falecido> falecidos)
    {
        string html = string.Empty;

        foreach (var falecido in falecidos)
        {
            html += @"
                <div class='card-falecido card mb-3'>
                    <div class='velas-acesas' title='Velas acesas'>
                        <div class='vela-icone'>🕯️</div>
                        <span class='vela-numero'>{falecido.VelasAcesas}</span>
                    </div>
                    <h4 class='mb-2'><strong>{falecido.Nome}</strong></h4>
                    <div class='data-falecido mb-2'>✟ {falecido.DataFalecimento:dd/MM/yyyy}</div>
                    <div class='d-flex gap-2'>   
                        <asp:Button ID='btnAcenderVela_{falecido.Id}'
                            runat='server'
                            class='btn btn-acender-vela
                            'Text='Acender vela 🔥'
                            OnClick='btnAcenderVela_Click' />
                        <button 
                            type='button' 
                            class='btn btn-escrever-prece' 
                            data-bs-toggle='modal' 
                            data-bs-target='#modalPrece'>
                            Escrever prece ✍️
                        </button>
                        </div>
                     </div>
                 </div>";
        }

        cardsContainer.InnerHtml = html;
    }

    //private List<Falecido> GetFalecidos()
    //{
    //    return new List<Falecido>
    //    {
    //        new Falecido { Id = 1, Nome = "Thyago Alves Tenório Da Silva", DataFalecimento = new DateTime(2027, 01, 25), VelasAcesas = 0 },
    //        new Falecido { Id = 2, Nome = "Paulo Victor Dos Santos Fonseca", DataFalecimento = new DateTime(2100, 01, 25), VelasAcesas = 0 },
    //        new Falecido { Id = 3, Nome = "Ryan Argolo Parada Garrido", DataFalecimento = new DateTime(2027, 04, 23), VelasAcesas = 0 },
    //        new Falecido { Id = 4, Nome = "Carla Vitoria", DataFalecimento = new DateTime(2027, 01, 28), VelasAcesas = 0 },

    //    };
    //}

  

    public class Falecido
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string DataNascimento  { get; set; }
        public string DataFalecimento { get; set; }
        public int VelasAcesas { get; set; }
        public string LocalObito { get; set; }
    }

    private List<Falecido> GetFalecidos()
    {
        string conexaoString = System.Configuration.ConfigurationManager.ConnectionStrings["MinhaConexao"].ConnectionString;

        var falecidos = new List<Falecido>();

        string consulta = "SELECT IdVitima, Nome, DataNascimento, DataFalecimento, LocalObito FROM Vitima";

        using (SqlConnection conexao = new SqlConnection(conexaoString))
        {
            using (SqlCommand comando = new SqlCommand(consulta, conexao))
            {
                conexao.Open();
                using (SqlDataReader leitor = comando.ExecuteReader())
                {
                    while (leitor.Read())
                    {
                        falecidos.Add(new Falecido
                        {
                            Id = Convert.ToInt32(leitor["IdVitima"]),
                            Nome = leitor["Nome"].ToString(),
                            DataNascimento = leitor["DataNascimento"].ToString(),
                            DataFalecimento = leitor["DataFalecimento"].ToString(),
                            LocalObito = leitor["LocalObito"].ToString()
                        });
                    }
                }
            }

        }

        return falecidos;

    }

    private void AdicionarFalecido(Falecido falecido)
    {

        string conexaoString = System.Configuration.ConfigurationManager.ConnectionStrings["MinhaConexao"].ConnectionString;

        string inserir = "INSERT INTO Vitima (Nome, DataNascimento, DataFalecimento, LocalObito) VALUES (@Nome, @DataNascimento, @DataFalecimento, @LocalObito)";

        using (     SqlConnection conexao = new SqlConnection(conexaoString))
        {
            using (SqlCommand comando = new SqlCommand(inserir, conexao))
            {

                comando.Parameters.AddWithValue("@Nome", falecido.Nome);
                comando.Parameters.AddWithValue("@DataNascimento", falecido.DataNascimento);
                comando.Parameters.AddWithValue("@DataFalecimento", falecido.DataFalecimento);
                comando.Parameters.AddWithValue("LocalObito", falecido.LocalObito);

                conexao.Open();
                comando.ExecuteNonQuery();
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Falecido> falecidos = GetFalecidos();
            

            foreach (var falecido in falecidos)
            {
               
                // Concatenação de strings para gerar o HTML do card
                string cardHtml = "<div class='card-falecido card mb-3' data-bs-toggle='modal' data-bs-target='#perfil'>" +
                                  "<div class='velas-acesas' title='Velas acesas'>" +
                                      "<div class='vela-icone'>🕯️</div>" +
                                   //   "<span class='vela-numero'>" + falecido.Vela.ToString() + "</span>" +
                                  "</div>" +
                                  "<h4 class='mb-2'>" +
                                      "<strong>" + falecido.Nome + "</strong>" +
                                  "</h4>" +
                                 // "<div class='data-falecido mb-2'>✟ " + falecido.DataFalecimento.ToString("dd/MM/yyyy") + "</div>" +
                                  "<div class='d-flex gap-2'>" +
                                      "<asp:Button ID='btnAcenderVela_" + falecido.Nome.Replace(" ", "_") + "' runat='server' " +
                                                  "class='btn btn-acender-vela' Text='Acender vela 🔥' " +
                                                  "OnClick='btnAcenderVela_Click' />" +
                                      "<button type='button' class='btn btn-escrever-prece' data-bs-toggle='modal' data-bs-target='#modalPrece'>" +
                                          "Escrever prece ✍️" +
                                      "</button>" +
                                  "</div>" +
                              "</div>";

                // Criando e adicionando o controle Literal na página
                Literal cardLiteral = new Literal();
                cardLiteral.Text = cardHtml;
                cardsContainer.Controls.Add(cardLiteral);
            }
        }
    }
}