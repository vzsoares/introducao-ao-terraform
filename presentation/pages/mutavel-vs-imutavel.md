---
transition: slide-up
---

# Mutável vs Imutável

Como isso se relaciona com procedural e declarativo?

<Logo />

Tipicamente, ferramentas procedurais serão imutáveis, e ferramentas declarativas serão mutáveis.

#### Mutável:

Significa que um mesmo código cria e altera a infraestrutura.

> Isso ocorre graças ao **State**.

#### Imutável:

É necessário utilizar blocos de código diferentes para criar e alterar, além de código para orquestrar qual bloco utilizar.

> Isso acontece porque o controle do estado é responsabilidade do implementador.

<v-click>

##### Não se esqueça de que cada ferramenta tem seu uso adequado. {style="margin-top:16px;color:red"}

</v-click>

---

# Mutável vs Imutável

<Logo />

### Caso de uso:

#### Mutável:

<p class="mini">(declarativo)</p>
<p class="closer">Normalmente para criar os elementos da infraestrutura e os relacionar minimamente.</p>

#### Imutável

<p class="mini">(procedural)</p>
<p class="closer">Normalmente para realizar operações mais caras ou delicadas como atualizar um sistema, setar segredos, configurações finas.</p>


