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
- guardar seus arquivos.
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

#### Arquitetura: 

```mermaid
graph TD;
    Fulano -->| | ServidorWeb;
    ServidorWeb -->| | SistemaDeArquivos;
```

---
transition: slide-up
---

# Exemplo

#### Infraestrutura: 

```mermaid
graph TD;
    Fulano --> ECS;
    ECS --> S3;
```
<p class="mini pt-4">ta faltando coisa mas deixa passar</p>

---

# Exemplo

#### Terraform
<p class="mini">Agora sim</p>

#### [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
