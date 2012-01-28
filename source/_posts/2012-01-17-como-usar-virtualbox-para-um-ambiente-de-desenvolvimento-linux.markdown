---
layout: post
title: "Como usar VirtualBox para um ambiente de desenvolvimento Linux"
date: 2012-01-17 23:48
comments: true
published: false
categories: [Portuguese, Development, Linux]
---
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) &eacute; uma ferramenta para criar e executar máquinas virtuais. &Eacute; oferecida por Oracle e esta disponivel gratuitamente.

## Criando uma máquina virtual

1. Baixe o [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Clique em "Machine > New", e depois, "Next".
3. Coloque um nome para a sua máquina virtual.
4. Selecione "Linux" e "Ubuntu" e clique em "Next".
5. Selecione o tanto de memoria que voc&ecirc; quer usar para a máquina virtual. Eu recomendo utilizar o m&aacute;ximo poss&iacute;vel, mas n&atidle;o mais que (RAM total) - (m&iacute;nimo para rodar o sistema operacional do computador). Por exemplo: 12GB - 4GB (m&iacute;nimo para Windows 7) = 8GB m&aacute;ximo para a m&aacute;quina virtual.
6. Na tela de "Virtual Hard Disk", selecione "Create new hard disk". Depois clique em "Next".
7. Selecione "Fixed-sized storage" e no m&inimo 4GB para o disco duro. A instala&ccedil;&atilde;o do Ubuntu requer 4GB de disco duro, mas &eacute; recomend&aacute;vel utilizar mais (8GB por exemplo).
8. Clique em "Finish" e espere que a máquina virtual seja criada.

## Instalando Ubuntu
1. Depois da máquina ser criada, baixe o [.iso do Ubuntu](http://www.ubuntu.com/download/ubuntu/download).
2. Agora &eacute; necess&aacute;rio configurar o .iso do Ubuntu como um cd virtual.
3. Clique em **Settings** e depois em **Storage**.
4. Clique em **IDE Controller** e depois no icone do CD perto disso.
5. Procure a .iso and selecione-la.
6. Selecione a sua m&aacute;quina virtual e clique na seta verde que diz **Start**.
7. Agora &eacute; inicie a sua m&aacute;quina virtual e fa&ccedil;a a instala&ccedil;&atilde;o do Ubuntu normalmente.
