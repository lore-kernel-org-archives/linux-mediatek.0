Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DCBC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNvNnv7fLkPCXzKFOmKReFLq3t6eZIeRklyaC85DyKA=; b=VsK94xCAvpbr/mktPouI/z7Pim
	Gw/l8cWap6DfCJpiPQmcKSRm4h1t+tzWMMhkle+hKrDAo+oXMALV7blcIIg0I6ehpYL/OmqzGPWmE
	aEr/zKFSFDgD3XN8tGNFQeMj/Qqh2w8yIkNp6Bj/oY4kuGPUGzOhtCfl6woEnv0NTZOqQbyf45yhP
	85elPhTSsOsiumKQPMnQj3sqt09En67/psW89BkaRKBKaEOCQpbG4anNkOTwLdpO1PQrxrqLn0XU/
	h9m2QBCqbyGoX2LQJJgneda4FwEALhK7RODWU5558w08bMTZ/wSDdURtdgCFdNAdGZ5mXxEaTiNnH
	R308d8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2pRP-0000000Fu9c-0Osy;
	Fri, 03 May 2024 09:42:55 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2pRL-0000000Fu8M-3j7B;
	Fri, 03 May 2024 09:42:53 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-23d1c4c14ceso2094159fac.0;
        Fri, 03 May 2024 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714729370; x=1715334170; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNvNnv7fLkPCXzKFOmKReFLq3t6eZIeRklyaC85DyKA=;
        b=m/Ag23feuwgdFUECcSylQ2Xkc0QrP8EjfoadgjCkoLpLCvOyE4t1Vcx0Q9y9s8dIrc
         kn8Ubof/WYa7FlLoqu0cgeTuW0V8Yqnzm0zhcP8wv4druOR+WbMmjQlpnUa1chd71AMG
         xN2tA/COBwwPSM+mH+hu8n0117GKiI7vEA9i48sV5AXZU01eReG5YhT4zvxRDWzGiZJW
         RJFZTQ4U+PDMJ781oOUztV3ZNU4/BG4yJeb8OpzF0uknWZrpy14vPLXcAIyrP1+AYWmy
         Q3B2fNVpAGl+PtaF2b3I/1nJsu73rgUyQUvBsNI8ep/4NhcsTdA0ilu8UJXmJ/7h1gDk
         ipWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714729370; x=1715334170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNvNnv7fLkPCXzKFOmKReFLq3t6eZIeRklyaC85DyKA=;
        b=O/KqEzrrH/rsSfzcfpzjRWGi7yhJzwvjRq17y/sE1A+57iQhPLalZQNbsQBkCfR20U
         tvK7Js08aYEl7ed+fO9uXbv/ERYteimy6dwm+wOvKunhvmJi1RbDphxyxic/WKmS94sN
         iMcSohqxZKUGLxWDLA1tf3kmrtXZQaaxcZGaj4qvWiZh6OEOLc9u44k5upfCn8Xh8qx9
         l0bOjhSp0BzJy/MIkQdfjcgdqZ+4iSPBIlTD7yTTlcbTpN6Kfl51WKB+wH8dAVq9PcgI
         Qp0jcAdLtSro8kikueAY0vKr9WVTNvfpG3+mDX/lObsWmOya3aQKgZL/aOOzsofLSpF5
         0d2A==
X-Forwarded-Encrypted: i=1; AJvYcCXVcC29sQzNn0PPypZxGij3cmDtiKHvyYJ25+z7Vv6A0Yls0xpYpHZf8vtI8RPCA4Y3TJoQJtqCVp7NK+asuzV1EOoYw+vJo31tm5/DyxWYz2GiRIkHUEzdmj2ScPyBDw4x4AjDxscadsrkXr5SH7aGftHMhQxrjrs=
X-Gm-Message-State: AOJu0Yza2cJYgiWk2jhVrEf3KTopiM/v/BVSe4fNJcf6vzfZUp5bpP+9
	VJAgM9clyfcYyGXliIxaC4h+T8DpuXD2BZfgbP7WWjmC72yCe7t0HAQP2BhVS8X0D8uC69Tf/EZ
	t2E6g+LPuslDeYFY5ucYCaLUvbpo=
X-Google-Smtp-Source: AGHT+IGQcWXxd+BM5x+nAd/5x4yuwDSrpPyFyTdrKfaxLe3etJovQ+UiyQUFC9RN9OY08oq5WERdzlNMzq8Vdb6sLIo=
X-Received: by 2002:a05:6870:fba1:b0:23c:ca10:cc23 with SMTP id
 kv33-20020a056870fba100b0023cca10cc23mr2524346oab.51.1714729369911; Fri, 03
 May 2024 02:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240429104633.11060-1-ilpo.jarvinen@linux.intel.com> <20240429104633.11060-8-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20240429104633.11060-8-ilpo.jarvinen@linux.intel.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 May 2024 11:42:37 +0200
Message-ID: <CAMhs-H_x85BXw0z+gRpS84UT3OCcaewtP7cDq4SVD4YWyeUcRw@mail.gmail.com>
Subject: Re: [PATCH 07/10] PCI: Replace PCI_CONF1{,_EXT}_ADDRESS() with the
 new helpers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_024251_959407_790CF544 
X-CRM114-Status: GOOD (  22.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Apr 29, 2024 at 12:47=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Replace the old PCI_CONF1{,_EXT}_ADDRESS() helpers used to calculate
> PCI Configuration Space Type 1 addresses with the new
> pci_conf1{,_ext}_offset() helpers that are more generic and more widely
> available.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/controller/pci-ftpci100.c | 6 ++----
>  drivers/pci/controller/pci-ixp4xx.c   | 5 ++---
>  drivers/pci/controller/pcie-mt7621.c  | 7 +++----
>  drivers/pci/pci.h                     | 8 --------
>  4 files changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controll=
er/pci-ftpci100.c
> index ffdeed25e961..a8d0217a0b94 100644
> --- a/drivers/pci/controller/pci-ftpci100.c
> +++ b/drivers/pci/controller/pci-ftpci100.c
> @@ -182,8 +182,7 @@ static int faraday_raw_pci_read_config(struct faraday=
_pci *p, int bus_number,
>                                        unsigned int fn, int config, int s=
ize,
>                                        u32 *value)
>  {
> -       writel(PCI_CONF1_ADDRESS(bus_number, PCI_SLOT(fn),
> -                                PCI_FUNC(fn), config),
> +       writel(pci_conf1_addr(bus_number, fn, config, true),
>                         p->base + FTPCI_CONFIG);
>
>         *value =3D readl(p->base + FTPCI_DATA);
> @@ -214,8 +213,7 @@ static int faraday_raw_pci_write_config(struct farada=
y_pci *p, int bus_number,
>  {
>         int ret =3D PCIBIOS_SUCCESSFUL;
>
> -       writel(PCI_CONF1_ADDRESS(bus_number, PCI_SLOT(fn),
> -                                PCI_FUNC(fn), config),
> +       writel(pci_conf1_addr(bus_number, fn, config, true),
>                         p->base + FTPCI_CONFIG);
>
>         switch (size) {
> diff --git a/drivers/pci/controller/pci-ixp4xx.c b/drivers/pci/controller=
/pci-ixp4xx.c
> index ec0125344ca1..fd52f4a3ef31 100644
> --- a/drivers/pci/controller/pci-ixp4xx.c
> +++ b/drivers/pci/controller/pci-ixp4xx.c
> @@ -192,9 +192,8 @@ static u32 ixp4xx_config_addr(u8 bus_num, u16 devfn, =
int where)
>                        BIT(32 - PCI_SLOT(devfn));
>         } else {
>                 /* type 1 */
> -               return (PCI_CONF1_ADDRESS(bus_num, PCI_SLOT(devfn),
> -                                         PCI_FUNC(devfn), where) &
> -                       ~PCI_CONF1_ENABLE) | PCI_CONF1_TRANSACTION;
> +               return pci_conf1_addr(bus_num, devfn, where, false) |
> +                      PCI_CONF1_TRANSACTION;
>         }
>  }
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controlle=
r/pcie-mt7621.c
> index 79e225edb42a..2b2d9828a910 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -127,8 +127,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_b=
us *bus,
>                                          unsigned int devfn, int where)
>  {
>         struct mt7621_pcie *pcie =3D bus->sysdata;
> -       u32 address =3D PCI_CONF1_EXT_ADDRESS(bus->number, PCI_SLOT(devfn=
),
> -                                           PCI_FUNC(devfn), where);
> +       u32 address =3D pci_conf1_ext_addr(bus->number, devfn, where, tru=
e);
>
>         writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
>
> @@ -143,7 +142,7 @@ static struct pci_ops mt7621_pcie_ops =3D {
>
>  static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 r=
eg)
>  {
> -       u32 address =3D PCI_CONF1_EXT_ADDRESS(0, dev, 0, reg);
> +       u32 address =3D pci_conf1_ext_addr(0, PCI_DEVFN(dev, 0), reg, tru=
e);
>
>         pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
>         return pcie_read(pcie, RALINK_PCI_CONFIG_DATA);
> @@ -152,7 +151,7 @@ static u32 read_config(struct mt7621_pcie *pcie, unsi=
gned int dev, u32 reg)
>  static void write_config(struct mt7621_pcie *pcie, unsigned int dev,
>                          u32 reg, u32 val)
>  {
> -       u32 address =3D PCI_CONF1_EXT_ADDRESS(0, dev, 0, reg);
> +       u32 address =3D pci_conf1_ext_addr(0, PCI_DEVFN(dev, 0), reg, tru=
e);
>
>         pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
>         pcie_write(pcie, val, RALINK_PCI_CONFIG_DATA);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index cf0530a60105..fdf9624b0b12 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -833,12 +833,4 @@ struct pci_devres {
>
>  struct pci_devres *find_pci_dr(struct pci_dev *pdev);
>
> -#define PCI_CONF1_ADDRESS(bus, dev, func, reg) \
> -       (PCI_CONF1_ENABLE | \
> -        pci_conf1_addr(bus, PCI_DEVFN(dev, func), reg & ~0x3U))
> -
> -#define PCI_CONF1_EXT_ADDRESS(bus, dev, func, reg) \
> -       (PCI_CONF1_ENABLE | \
> -        pci_conf1_ext_addr(bus, PCI_DEVFN(dev, func), reg & ~0x3U))
> -
>  #endif /* DRIVERS_PCI_H */
> --
> 2.39.2
>

I have tested in a GnuBee v1 board based on mt7621 and all PCI
enumeration and so on is working properly. Hence, for MT7621:

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

