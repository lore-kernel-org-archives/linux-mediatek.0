Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 06:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKTV5wf8aoqKZU3aJrhH2kpNKYGrRnI7yhp9Bsyo9E8=; b=aefT4nXbBNoQmA
	9YQYQDrHqg8g8I7MtUDJBYCxvgXtMOIK0DLe7mDWiQbhBPK0dMS7bIMbjdpRgyMCSiwnFl+4IgFKw
	i+FZpu1jtustI5abcVZSS++gXLj47zj4dsLrB2g6h6kQZA92hRI7Op/nBnhewzYIeVFg+q8VDWkxA
	MiSc0xvRdPnXIDNOifiGCqLWoJ9QSIt4NvyrxZDTuGwcwgN6Pmk4ES+7m0eJj6RdFO5sb9btU11sb
	lT7yDiukjp2wb0Oo3eetzQiDwfzyvTQwsaOPOp8yoDPxlAHV/ZfYxHmV6pj6EsT9sd1sYHzcx0ruX
	MDreRoHZHbcPnaHpKSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0HJP-00Bujn-Me; Thu, 23 Dec 2021 06:10:47 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0HJC-00Buhn-Tb; Thu, 23 Dec 2021 06:10:36 +0000
Received: by mail-ua1-x935.google.com with SMTP id o63so8339153uao.5;
 Wed, 22 Dec 2021 22:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbHNzp0204AmGb5gPBzrhCaSQYS/qpv5OEmWLv004RY=;
 b=nmQzvwN31vfL6pLvMdPSyGBKc0/BjhCPChI0XF/UNmsxfyCq3noCj+jkkNrOSiBJ36
 n1Gf+iv9aqSOSU2Ji9nOt63ud5W88rSKrphUFbnk58wgWVMdQVr02G1uHiDSGbbKZv/u
 7X6oVkRrvi7rDZBwdishmTglfL4Om0uH9K2gTpjevxI5zeJYOO8merwJVWKQ8qcY4AgY
 Ikxt7b5+Xegk3CimZi5E8bNjWH5CFf/JWvHqLEZoieNx2x+pshuebOqjMikH9W/0wZPf
 94LQJ6r6i2V9HoLfMKH8Nkvueghodi58kfP32lARiLLvfmKVv1x5mG8ZMVQcKch+k3/U
 bioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbHNzp0204AmGb5gPBzrhCaSQYS/qpv5OEmWLv004RY=;
 b=GwRa8ao7dEP82agHvGT8n569OpXsuXm4I902TjjLEtG/Qzov1O0vMweZ8971t07vyV
 gRbtMVHDuLV/RaQrSYyrgcHTmM4FlBqkGhw6yEVYGyLztba+agFepDOfDSv7aH8cV/SP
 zPgVnDSFWxm6rvuhLYcr0qx9X8gZbHgwK2g/rahftB9D3zLL7AHTgyFoP0ZSkoL3h+6G
 HNV+FlxdnP2PCH9ifukBdtS4Dsg1qS4BEQeMEUkIuGh+ACyb2ctZwvq9RtMP/HeDI+ez
 R+iP49c0lA0Bp+4u4265XlWYPEMPEa9q5NrAXLc0knyHqf8k3QEiLublYtZsZOwcDqIg
 czgw==
X-Gm-Message-State: AOAM531DGM6SrPIWKTWkiLmkdFHIiHYBZ4SN5TspYAsl2pJEJAac8e3H
 6ixSbda0saJSlWWMdLE/LbCp1RLkNcNWnhKyV6M=
X-Google-Smtp-Source: ABdhPJxX4ofazdWru2duop3h2wcaB6hEw3qBHoxMUWn6OqVNFWPGiu3x2H6Mq80mQcMyVr2Kx3X5B3k7gd0i1DLMZMY=
X-Received: by 2002:a9f:25b6:: with SMTP id 51mr257897uaf.0.1640239833796;
 Wed, 22 Dec 2021 22:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20211223011054.1227810-1-helgaas@kernel.org>
 <20211223011054.1227810-18-helgaas@kernel.org>
In-Reply-To: <20211223011054.1227810-18-helgaas@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 23 Dec 2021 07:10:22 +0100
Message-ID: <CAMhs-H_dTkp6_1Loq973JqotW26GtRYQv-vdQ2i6Heo7oGCL3w@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci <linux-pci@vger.kernel.org>, Fan Fei <ffclaire1224@gmail.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_221034_999528_A8493CC7 
X-CRM114-Status: GOOD (  25.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bjorn,

On Thu, Dec 23, 2021 at 2:11 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Rename mt7621_pci_* structs and functions to mt7621_pcie_* for consistency
> with the rest of the file.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pci/controller/pcie-mt7621.c | 36 ++++++++++++++--------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index 4138c0e83513..b8fea7afdb1b 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -93,8 +93,8 @@ struct mt7621_pcie_port {
>   * reset lines are inverted.
>   */
>  struct mt7621_pcie {
> -       void __iomem *base;
>         struct device *dev;
> +       void __iomem *base;

This change is unrelated to the commit message and the rest of the
changes of this patch.

>         struct list_head ports;
>         bool resets_inverted;
>  };
> @@ -129,7 +129,7 @@ static inline void pcie_port_write(struct mt7621_pcie_port *port,
>         writel_relaxed(val, port->base + reg);
>  }
>
> -static inline u32 mt7621_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
> +static inline u32 mt7621_pcie_get_cfgaddr(unsigned int bus, unsigned int slot,
>                                          unsigned int func, unsigned int where)
>  {
>         return (((where & 0xf00) >> 8) << 24) | (bus << 16) | (slot << 11) |
> @@ -140,7 +140,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
>                                          unsigned int devfn, int where)
>  {
>         struct mt7621_pcie *pcie = bus->sysdata;
> -       u32 address = mt7621_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
> +       u32 address = mt7621_pcie_get_cfgaddr(bus->number, PCI_SLOT(devfn),
>                                              PCI_FUNC(devfn), where);
>
>         writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
> @@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
>         return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
>  }
>
> -static struct pci_ops mt7621_pci_ops = {
> +static struct pci_ops mt7621_pcie_ops = {
>         .map_bus        = mt7621_pcie_map_bus,
>         .read           = pci_generic_config_read,
>         .write          = pci_generic_config_write,
> @@ -156,7 +156,7 @@ static struct pci_ops mt7621_pci_ops = {
>
>  static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
>  {
> -       u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
> +       u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
>
>         pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
>         return pcie_read(pcie, RALINK_PCI_CONFIG_DATA);
> @@ -165,7 +165,7 @@ static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
>  static void write_config(struct mt7621_pcie *pcie, unsigned int dev,
>                          u32 reg, u32 val)
>  {
> -       u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
> +       u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
>
>         pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
>         pcie_write(pcie, val, RALINK_PCI_CONFIG_DATA);
> @@ -505,16 +505,16 @@ static int mt7621_pcie_register_host(struct pci_host_bridge *host)
>  {
>         struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
>
> -       host->ops = &mt7621_pci_ops;
> +       host->ops = &mt7621_pcie_ops;
>         host->sysdata = pcie;
>         return pci_host_probe(host);
>  }
>
> -static const struct soc_device_attribute mt7621_pci_quirks_match[] = {
> +static const struct soc_device_attribute mt7621_pcie_quirks_match[] = {
>         { .soc_id = "mt7621", .revision = "E2" }
>  };
>
> -static int mt7621_pci_probe(struct platform_device *pdev)
> +static int mt7621_pcie_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         const struct soc_device_attribute *attr;
> @@ -535,7 +535,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, pcie);
>         INIT_LIST_HEAD(&pcie->ports);
>
> -       attr = soc_device_match(mt7621_pci_quirks_match);
> +       attr = soc_device_match(mt7621_pcie_quirks_match);
>         if (attr)
>                 pcie->resets_inverted = true;
>
> @@ -572,7 +572,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
>         return err;
>  }
>
> -static int mt7621_pci_remove(struct platform_device *pdev)
> +static int mt7621_pcie_remove(struct platform_device *pdev)
>  {
>         struct mt7621_pcie *pcie = platform_get_drvdata(pdev);
>         struct mt7621_pcie_port *port;
> @@ -583,18 +583,18 @@ static int mt7621_pci_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -static const struct of_device_id mt7621_pci_ids[] = {
> +static const struct of_device_id mt7621_pcie_ids[] = {
>         { .compatible = "mediatek,mt7621-pci" },
>         {},
>  };
> -MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
> +MODULE_DEVICE_TABLE(of, mt7621_pcie_ids);
>
> -static struct platform_driver mt7621_pci_driver = {
> -       .probe = mt7621_pci_probe,
> -       .remove = mt7621_pci_remove,
> +static struct platform_driver mt7621_pcie_driver = {
> +       .probe = mt7621_pcie_probe,
> +       .remove = mt7621_pcie_remove,
>         .driver = {
>                 .name = "mt7621-pci",
> -               .of_match_table = of_match_ptr(mt7621_pci_ids),
> +               .of_match_table = of_match_ptr(mt7621_pcie_ids),
>         },
>  };
> -builtin_platform_driver(mt7621_pci_driver);
> +builtin_platform_driver(mt7621_pcie_driver);
> --
> 2.25.1
>

Other than that minor unrelated change, this looks good to me:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
