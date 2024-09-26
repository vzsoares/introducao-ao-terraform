---
transition: slide-up
---

# Recursos _Terraform HCL_

<Logo />

- Modules
- Resources
- State
- Data Sources
- Variables
- Outputs

---
transition: slide-up
---

# Modules

<Logo />

##### Módulos são um conjunto de arquivos .tf

- Toda pasta é um módulo.
- Todos os arquivos de um módulo são interpretados como parte do mesmo módulo
    > Ou seja, são logicamente relacionados, e quaisquer separações são puramente por praticidade.
- Nem todo módulo é aplicado (pode ser apenas um componente)
    > Root module e child module;
    > O que os diferencia é a existência de um _`provider`_.

<br/>

```sh
projeto1/ # módulo root
└── main.tf
└── provider.tf
projeto2/ # módulo root
├── main.tf
└── provider.tf
├── coisa/ # módulo child
│   └── main.tf
└── outro/ # não é um módulo
    └── bloco.txt
```

<!--
Módulos child podem estar em qualquer lugar! Como repositórios ou outras pastas.
-->

---
transition: slide-up
---

# Resources

<Logo />

##### São os recursos específicos dos provedores, ex: s3_bucket, apiGateway_api,<br> ec2_instance, lambda_function.

Cada recurso terá sua própria documentação.

Ao definir um recurso, ele **será** criado.

```tf

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
}

```

<br/>
<br/>

#### [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

<!--
São um produto de um provedor.
-->

---
transition: slide-up
---

# State

<Logo />

O estado da infraestrutura é justamente o "relatório" de como a infraestrutura está.<br>Cada vez que a declaração da infraestrutura for alterada, isso **será** refletido no estado.<br>Por padrão, este estado é salvo em um arquivo local chamado `terraform.tfstate`.

</br>

<v-click>

#### Salvar este arquivo localmente é uma solução <span v-mark.underline.orange="1" style="color:var(--tertiary)">perene?</span>

</v-click>

<v-click>

E se você perder acesso à máquina?<br>E se o colega quiser fazer uma alteração?

</v-click>

<v-click>

> O arquivo de estado pode conter informações sensíveis, como chaves SSH, variáveis de ambiente, senhas de banco.<br>Por isso, seu acesso deve ser controlado e seguro.

Deve-se, portanto, salvar em uma solução remota, como o S3.<br>O Terraform chama isso de `remote backend`.

> A infraestrutura deve ser dividida em múltiplos arquivos. Recursos que dependem exclusivamente uns dos outros podem até ser declarados juntos, mas sempre que possível devem ser separados para evitar erros.

</v-click>

---
transition: slide-up
---

# Data Sources

<Logo />

É uma forma de utilizar um recurso já existente.

Imagine um certificado SSL; é provável que vários recursos utilizem o mesmo!

```tf
# Find a certificate that is issued
data "aws_acm_certificate" "issued" {
  domain   = "tf.example.com"
  statuses = ["ISSUED"]
}

# Use certificate
resource "aws_api_gateway_domain_name" "example" {
  certificate_arn = data.issued.certificate_arn
  domain_name     = "api.example.com"
}
```

---
transition: slide-up
---

# Variables

<Logo />

Variáveis

```tf
variable "name" {
  description = "Nome do recurso"
  type = string
  default = "blank"
}

variable "stage" {
  type = string
  validation {
    condition     = contains(["dev", "prod"], var.stage)
    error_message = "Stage inválido"
  }
}

```

---

# Outputs

<Logo />

Informações de saída de um módulo

```tf

resource "aws_s3_bucket" "example" {
  bucket = var.name
}

output "arn" {
  value = aws_s3_bucket.example.arn
}
output "id" {
  value = aws_s3_bucket.example.id
}

```