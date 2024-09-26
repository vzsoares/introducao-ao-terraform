---
transition: slide-up
---

# Exemplo

<Logo />

### Fluxo comum de desenvolvimento:


<div align="center" id="main">

```mermaid
block-beta
    blockArrowId<["Problema"]>(right)
    blockArrowId2<["Arquitetura"]>(right)
    blockArrowId3<["Infraestrutura"]>(right)
```

</div>

<v-click>

#### Problema: 

Fulano quer:
- Guardar seus arquivos.
- Poder acessar a qualquer momento.
- Não perder nunca.

</v-click>

<style>
#main {
  margin-top: 50px;
}
</style>

---
transition: slide-up
---

# Exemplo

<Logo />

#### Arquitetura: 

Sabendo o problema fica fácil encontrar a solução.
<p class="mini">É total interesse do provedor de infra te fornecer soluções. <br/>Sabia que se você fosse uma super empresa, a propria aws iria fazer reuniões com você</p>

<p style="margin:0 !important;">A propria aws tem excelentes recursos.</p>

- [Parecido com o que vamos fazer](https://aws.amazon.com/blogs/architecture/building-a-three-tier-architecture-on-a-budget/)
- [Blog com varias soluções](https://aws.amazon.com/blogs/architecture/page/3/)

<div class="mt-2"></div>
```mermaid
graph TD;
    Fulano -->| | ServidorWeb;
    ServidorWeb -->| | SistemaDeArquivos;
```

---
transition: slide-up
---

# Exemplo

<Logo />

#### Infraestrutura: 

```mermaid
graph TD;
    Fulano --> ECS;
    ECS --> S3;
```
<p class="mini pt-4">Ná prática com certeza teriam mais componentes...</p>

---

# Exemplo

<Logo />

#### Terraform
<p class="mini">Agora sim</p>

Vamos:

- Encontrar nossos recursos e como configurar: [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- Configurar o `provider.tf`
- Subir e testar
