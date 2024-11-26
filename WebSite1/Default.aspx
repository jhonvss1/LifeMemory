<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Memória Viva</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet.css" />
  </head>
  <body>
    <form id="form1" runat="server">
      <div class="container-fluid">
        <div class="row">
          <!-- Sidebar -->
          <div class="col-md-4 d-flex flex-column vh-100">
            <!-- Logomarca -->
            <div class="d-flex justify-content-center py-3">
              <img
                src="imgs/logo.png"
                alt="Logomarca"
                class="img-fluid"
                style="max-width: 150px"
              />
            </div>

            <!-- Filtros -->
  <div class="py-3 px-md-5">
  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
    <path fill="currentColor" d="M21 4v2h-1l-5 7.5V22H9v-8.5L4 6H3V4zM6.404 6L11 12.894V20h2v-7.106L17.596 6z" />
  </svg>
   
  <asp:Button 
    ID="btnDataObito" 
    runat="server" 
    CssClass="btn-filtro-ativo" 
    OnClick="btnDataObito_Click" Text="Ordem Aleatória" />
  
  <asp:Button 
    ID="btnOrdemAlfabetica" 
    runat="server" 
    CssClass="btn-filtro-inativo"  
    OnClick="btnOrdemAlfabetica_Click" Text="Ordem Alfabética" />
</div>
                            <!-- Contêiner c todos os cards -->
            <div class="flex-grow-1 overflow-auto px-5" ID="cardsContainer" runat="server">
                                 <!-- Card individual -->
              <div
                class="card-falecido card mb-3"
                data-bs-toggle="modal"
                data-bs-target="#perfil"
              >
                <div class="velas-acesas" title="Velas acesas">
                  <div class="vela-icone">🕯️</div>
                  <span
                    id="lblVelaNumero"
                    runat="server"
                    class="vela-numero"
                  >0</span
                  >
                </div>
                <h4 class="mb-2">
                  <strong>Thyago Alves Tenório Da Silva</strong>
                </h4>
                <div class="data-falecido mb-2">✟ 25/01/2027</div>
                <div class="d-flex gap-2">
                    
                  <asp:Button
                    ID="btnAcenderVela1"
                    runat="server"
                    class="btn btn-acender-vela"
                    Text="Acender vela 🔥"
                    OnClick="btnAcenderVela_Click"
                  />               
                 <button
                   type="button"
                   class="btn btn-escrever-prece"
                   data-bs-toggle="modal"
                   data-bs-target="#modalPrece"
                 >
                   Escrever prece ✍️
                </button>              
                </div>
              </div>         
                             <!-- Card individual -->
  <div
    class="card-falecido card mb-3"
    data-bs-toggle="modal"
    data-bs-target="#perfil"
  >
    <div class="velas-acesas" title="Velas acesas">
      <div class="vela-icone">🕯️</div>
      <span
        id="lblVelaNumero1"
        runat="server"
        class="vela-numero"
      >0</span
      >
    </div>
    <h4 class="mb-2">
      <strong>Paulo Victor Dos Santos Fonseca</strong>
    </h4>
    <div class="data-falecido mb-2">✟ 26/03/2003</div>
    <div class="d-flex gap-2">
        
      <asp:Button
        ID="btnAcenderVela2"
        runat="server"
        class="btn btn-acender-vela"
        Text="Acender vela 🔥"
        OnClick="btnAcenderVela_Click"
      />               
     <button
       type="button"
       class="btn btn-escrever-prece"
       data-bs-toggle="modal"
       data-bs-target="#modalPrece"
     >
       Escrever prece ✍️
     </button>              
       </div>
     </div> 
                <!-- Card individual -->
                             <div
               class="card-falecido card mb-3"
               data-bs-toggle="modal"
               data-bs-target="#perfil"
             >
               <div class="velas-acesas" title="Velas acesas">
                 <div class="vela-icone">🕯️</div>
                 <span
                   id="lblVelaNumero2"
                   runat="server"
                   class="vela-numero"
                 >0</span
                 >
               </div>
               <h4 class="mb-2">
                 <strong>Ryan Argolo Parada Garrido</strong>
               </h4>
               <div class="data-falecido mb-2">✟ 25/01/2027</div>
               <div class="d-flex gap-2">
                   
                 <asp:Button
                   ID="btnAcenderVela"
                   runat="server"    
                   class="btn btn-acender-vela"
                   Text="Acender vela 🔥"
                   OnClick="btnAcenderVela_Click"
                 />               
                <button
                  type="button"
                  class="btn btn-escrever-prece"
                  data-bs-toggle="modal"
                  data-bs-target="#modalPrece"
                >
                  Escrever prece ✍️
               </button>              
               </div>
             </div>  
   <div
  class="card-falecido card mb-3"
  data-bs-toggle="modal"
  data-bs-target="#perfil"
>
  <div class="velas-acesas" title="Velas acesas">
    <div class="vela-icone">🕯️</div>
    <span
      id="lblVelaNumero3"
      runat="server"
      class="vela-numero"
    >0</span
    >
  </div>
  <h4 class="mb-2">
    <strong>Carla Vitoria</strong>
  </h4>
  <div class="data-falecido mb-2">✟ 25/01/2027</div>
  <div class="d-flex gap-2">
      
    <asp:Button
      ID="Button3"
      runat="server"
      class="btn btn-acender-vela"
      Text="Acender vela 🔥"
      OnClick="btnAcenderVela_Click"
    />               
   <button
     type="btnAcenderVela4"
     class="btn btn-escrever-prece"
     data-bs-toggle="modal"
     data-bs-target="#modalPrece"
   >
     Escrever prece ✍️
   </button>              
  </div>
 </div>  
</div>                      
            <!-- Botão pra add vitima -->
            <div class="p-3 text-center">
               <button
                 type="button"
                 class="btn btn-dark px-5 py-3 fw-bold"
                 data-bs-toggle="modal"
                 data-bs-target="#adicionarVitima"
                >
                 + Adicionar Vítima
                </button>
            </div>
          </div>

          <!-- Background e velona gigante -->
          <div class="col bg-dark bg-velona">
            <img src="imgs/vela.png" alt="Vela" class="Imagem da vela" />
          </div>
        </div>
      </div>

      <!-- Modal Cadastro Vitima -->
      <div
        class="modal fade"
        id="adicionarVitima"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="staticBackdropLabel">
                Adicionar Vítima
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="nomeFalecido" class="form-label">Nome</label>
                <input
                  type="text"
                  id="txtNomeFalecido"   
                  runat="server"
                  class="form-control"
                  placeholder="Nome completo do falecido"
                />
              </div>
              <div class="mb-3">
                <label for="dataNascimento" class="form-label">Data de Nascimento</label>
                <input
                  type="date"
                  id="txtDataNascimento"
                  runat="server"
                  class="form-control"                  
                  placeholder="Data de nascimento"
                />
              </div>
              <div class="mb-3">
                <label for="dataFalecimento" class="form-label">Data do Falecimento</label>
                <input
                  type="date"
                  id="txtDataFalecimento"
                  runat="server"
                  class="form-control"                 
                  placeholder="Data de falecimento"
                />
              </div>
              <div class="mb-3">
                <label for="localObito" class="form-label">Local do Óbito</label>
                <input
                  type="text"
                  id="txtLocalObito"
                  runat="server"
                  class="form-control"
                  placeholder="Local onde ocorreu o acidente"
                />
              </div>
            </div>
            <div class="modal-footer">
              <div class="d-grid col-8 mx-auto">
                <asp:Button
                  ID="btnAdicionarVitimaModal"
                  runat="server"
                  class="btn btn-dark px-3"
                  Text="Adicionar"
                  OnClick="btnAdicionarVitimaModal_Click"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal Perfil -->
      <div
        class="modal fade"
        id="perfil"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="staticBackdropLabel">
                <strong>Thyago Alves Tenório Da Silva</strong>
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
                      <div class="text-center m-4">
          <p class="h5">⭐ 01/01/2001</p>
          <p class="h5 mb-4">✝️ 01/01/2004</p>
          <em class="h6">Local do Acidente: Uninassau</em>
        </div>
        <!-- Card da prece no perfil -->
        <div class="card prece mb-3">
          <div class="card-body">
            <em class="card-text"
              >"Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Nulla doloribus voluptatum minima sequi, laudantium temporibus
              illo consectetur molestiae optio quaerat dolores debitis quo
              illum cum eum ab, totam, praesentium nihil."</em
            >
          </div>
          <div class="card-footer text-end">— Por Matheus Oliveira</div>
        </div>
        <div class="card prece mb-3">
          <div class="card-body">
            <em class="card-text"
              >"Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Nulla doloribus voluptatum minima sequi, laudantium temporibus
              illo consectetur molestiae optio quaerat dolores debitis quo
              illum cum eum ab, totam, praesentium nihil."</em
            >
          </div>
          <div class="card-footer text-end">— Por Matheus Oliveira</div>
        </div>
        <div class="card prece mb-3">
          <div class="card-body">
            <em class="card-text"
              >"Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Nulla doloribus voluptatum minima sequi, laudantium temporibus
              illo consectetur molestiae optio quaerat dolores debitis quo
              illum cum eum ab, totam, praesentium nihil."</em
            >
          </div>
          <div class="card-footer text-end">— Por Matheus Oliveira</div>
        </div>
        <div class="card prece mb-3">
          <div class="card-body">
            <em class="card-text"
              >"Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Nulla doloribus voluptatum minima sequi, laudantium temporibus
              illo consectetur molestiae optio quaerat dolores debitis quo
              illum cum eum ab, totam, praesentium nihil."</em
            >
          </div>
          <div class="card-footer text-end">— Por Matheus Oliveira</div>
        </div>
        <div class="card prece mb-3">
          <div class="card-body">
            <em class="card-text"
              >"Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Nulla doloribus voluptatum minima sequi, laudantium temporibus
              illo consectetur molestiae optio quaerat dolores debitis quo
              illum cum eum ab, totam, praesentium nihil."</em
            >
          </div>
          <div class="card-footer text-end">— Por Matheus Oliveira</div>
        </div>
        <div class="card prece mb-3">
          <div class="card-body">
            <em class="card-text"
              >"Lorem ipsum dolor sit amet consectetur adipisicing elit.
              Nulla doloribus voluptatum minima sequi, laudantium temporibus
              illo consectetur molestiae optio quaerat dolores debitis quo
              illum cum eum ab, totam, praesentium nihil."</em
            >
          </div>
          <div class="card-footer text-end">— Por Matheus Oliveira</div>
        </div>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
<!-- Modal Prece -->
    <div
      class="modal fade"
      id="modalPrece"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="staticBackdropLabel">
              Prece para Thyago
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label for="nomeFalecido" class="form-label">Seu nome</label>
              <input
                type="text"
                class="form-control"
                id="nomeFalecido"
                placeholder="Digite seu nome completo"
              />
            </div>
            <p class="h5">Você deseja...</p>
            <div class="form-check">
              <input
                class="form-check-input"
                type="radio"
                name="flexRadioDefault"
                id="flexRadioDefault2"
                checked
              />
              <label class="form-check-label" for="flexRadioDefault2">
                Escrever sua prece
              </label>
            </div>
            <div class="mb-3">
              <textarea
                class="form-control"
                id="exampleFormControlTextarea1"
                rows="3"
              ></textarea>
            </div>
            <div class="form-check">
              <input
                class="form-check-input"
                type="radio"
                name="flexRadioDefault"
                id="flexRadioDefault1"
              />
              <label class="form-check-label" for="flexRadioDefault1">
                Deixar que a gente escolha
              </label>
            </div>
          </div>
          <div class="modal-footer">
            <div class="d-grid col-8 mx-auto">       
                <asp:Button 
                  ID="btnSalvarPrece"
                  runat="server"
                  class="btn btn-success"
                  Text="Salvar Prece"
                  OnClick="btnSalvarPrece_Click"
                    />
            </div>
          </div>
        </div>
      </div>
    </div>
 </form>
      <script src="Scripts/bootstrap.bundle.min.js"></script>
  </body>
</html>
