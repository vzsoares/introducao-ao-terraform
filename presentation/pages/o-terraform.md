---
transition: slide-up
---

# O Terraform

<Logo />

Características Terraform:

- mutável/declarativa
- possui uma linguagem especializada (HCL)
- **consolidada**
- _gratuita_
- possuir uma grande comunidade
- _ser open source_

---
transition: slide-up
---

# HCL

<Logo />

O HCL é a linguagem de domínio específico utilizada pelo Terraform.

Similar ao JSON e com interoperabilidade com ele.

````md magic-move {lines: true}
```tf
// hcl
io_mode = "async"

service "http" "web_proxy" {
  listen_addr = "127.0.0.1:8080"
  
  process "main" {
    command = ["/usr/local/bin/awesome-app", "server"]
  }

  process "mgmt" {
    command = ["/usr/local/bin/awesome-app", "mgmt"]
  }
}
```

```json
// json
{
  "io_mode": "async",
  "service": {
    "http": {
      "web_proxy": {
        "listen_addr": "127.0.0.1:8080",
        "process": {
          "main": {
            "command": ["/usr/local/bin/awesome-app", "server"]
          },
          "mgmt": {
            "command": ["/usr/local/bin/awesome-app", "mgmt"]
          },
        }
      }
    }
  }
}
```
````

---

<Logo />

#### O HCL também possui:

- Expressões
  > `1 == 2 ? "okay" : "boooh"`
- Loops
  > `[for v in ["a", "b"]: v]` retorna `["a", "b"]`
- Variáveis
  > `name = "Bob"`
- Interpolação
  > `fullName = "${firstName} ${secondName}"`
- Funções nativas
  > `name = upper("bob")` retorna `BOB`

Ainda existem algumas particularidades no seu uso para o Terraform.