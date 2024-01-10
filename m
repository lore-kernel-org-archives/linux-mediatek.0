Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CA0C47073
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=08hvWAgiPewDXfZkaXlL6KDD20tFKkCJ2dXFPSuq2og=; b=BqGnTPS4HqPiPcDHbREZmJh3RB
	YXKvt5GTL3cmd9kCP45ZrmF2rgKrmbCR2TIFBvnV24dGn9sQJVhjduV1yK2GSMx1LOIxsSjyliKA4
	oj3bc1PM1O9PjUcQ31ujweQPNKr3ajwUEGh9nvW12ALU8p37a5C0QuqaNNe0Ei45y3q7QGvT59F7i
	5O4N7EhW7qOM3hsLN5zMMbQ/NjJ4fPen1lcYnN1Uc4oHeCnyTtniItyAVBpW2IRhdAZBgy2lkBazR
	WhRVN2GAvnEIZKtebMnjLlhud8BWDqNX1FDnQOjG6PlTpN1Xo/AIyTqmDrz68iVcGWC/sTKNN4mr+
	EJNmzsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNg2Z-00EFCu-0B;
	Wed, 10 Jan 2024 21:23:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNg2W-00EFBa-2l
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 21:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DE38618EA;
	Wed, 10 Jan 2024 21:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987E4C433C7;
	Wed, 10 Jan 2024 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704921784;
	bh=U23M4BnqUmQe+FZ2LuryebH7D7fAcpk83TMAju7/hB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pW1dcj1zvTnNRPfns6XF7nTb/HfRSXkkdg277b9w4HlSt/MGZ+sRontsI+MDrCrQA
	 ecRE5ZHr/jADkYEJQKWBRPEyDgp98YJwPNkyjv7YAf9ltbUUWLYcQxf3/bn36DjSCU
	 j2CIiud87RJT529EZfj24laCjFErXJ53QC6Fj6iezUUgJzPCvDDZmppw7hw5QMWPt3
	 7FqTDPHmnRXQ803YjSj9r6DGexm4lb8+iCb6J0A5y9YsLe2TsAtMeuTkDQW0gmizep
	 q20LAkMkwanoHrfPwVR3jdIZhX9b72nuZJidKSqhvTqSG+ciwNJm6h7Z7Vn9sw/LaG
	 vOR9dtaWXwosw==
Date: Wed, 10 Jan 2024 15:23:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org
Subject: Re: mt7621 static check warning
Message-ID: <20240110212302.GA2123146@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H_7EovAntGwmDUDS3HNKV5H4w1UM=7cpk9GMi7Hi_kQVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_132308_976978_340C03CD 
X-CRM114-Status: GOOD (  29.96  )
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

[+cc Vignesh for dra7xx snprintf issue and CONFIG_TI_PIPE3 question]

On Wed, Jan 10, 2024 at 08:16:33AM +0100, Sergio Paracuellos wrote:
> On Wed, Jan 10, 2024 at 12:51 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > FYI:
> >
> >   $ make W=1 drivers/pci/
> >     CC      drivers/pci/controller/pcie-mt7621.o
> >   drivers/pci/controller/pcie-mt7621.c: In function ‘mt7621_pcie_probe’:
> >   drivers/pci/controller/pcie-mt7621.c:228:49: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
> >     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
> >         |                                                 ^
> >   drivers/pci/controller/pcie-mt7621.c:228:9: note: ‘snprintf’ output between 10 and 11 bytes into a destination of size 10
> >     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
> >         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> 
> Would you be happy if I just increment the buffer as follows?
> 
> diff --git a/drivers/pci/controller/pcie-mt7621.c
> b/drivers/pci/controller/pcie-mt7621.c
> index 79e225edb42a..d97b956e6e57 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -202,7 +202,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
>         struct mt7621_pcie_port *port;
>         struct device *dev = pcie->dev;
>         struct platform_device *pdev = to_platform_device(dev);
> -       char name[10];
> +       char name[11];
>         int err;
> 
>         port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> 
> Or should I use scnprintf instead? Since the statement is not using
> function return value at all snprintf looks more correct and simpler
> at a first glance.

I don't know enough to have an opinion, but grep says all similar
cases in drivers/pci/ use snprintf(), so I guess I would follow the
crowd.  If there's an argument for scnprintf() instead, we can convert
them all at once.

> diff --git a/drivers/pci/controller/pcie-mt7621.c
> b/drivers/pci/controller/pcie-mt7621.c
> index 79e225edb42a..0eae1b5b079e 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -225,7 +225,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
>                 return PTR_ERR(port->pcie_rst);
>         }
> 
> -       snprintf(name, sizeof(name), "pcie-phy%d", slot);
> +       scnprintf(name, sizeof(name), "pcie-phy%d", slot);
>         port->phy = devm_of_phy_get(dev, node, name);
>         if (IS_ERR(port->phy)) {
>                 dev_err(dev, "failed to get pcie-phy%d\n", slot);
> 
> Both of them silence the warning, so let me know your preference here.
> 
> > I know we'll never actually hit this, but it'd be nice to clean this
> > up, and I don't think it would really cost us anything.  I think it's
> > currently the only "W=1" warning in drivers/pci/.
> 
> I am also getting this:
> 
> drivers/pci/controller/dwc/pci-dra7xx.c: In function ‘dra7xx_pcie_probe’:
> drivers/pci/controller/dwc/pci-dra7xx.c:754:41: error: ‘%d’ directive
> output may be truncated writing between 1 and 10 bytes into a region
> of size 2 [-Werror=format-truncation=]
>   754 |   snprintf(name, sizeof(name), "pcie-phy%d", i);
>       |                                         ^~
> drivers/pci/controller/dwc/pci-dra7xx.c:754:32: note: directive
> argument in the range [0, 2147483646]
>   754 |   snprintf(name, sizeof(name), "pcie-phy%d", i);
>       |                                ^~~~~~~~~~~~
> drivers/pci/controller/dwc/pci-dra7xx.c:754:3: note: ‘snprintf’ output
> between 10 and 19 bytes into a destination of size 10
>   754 |   snprintf(name, sizeof(name), "pcie-phy%d", i);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Oh, thanks for this.  I didn't have CONFIG_TI_PIPE3=y in my .config,
which CONFIG_PCI_DRA7XX depends on.

I didn't go to the trouble of trying to figure out exactly what
CONFIG_TI_PIPE3=y enables, but with the patch below, I *was* able to
successfully build and link a kernel with:

  CONFIG_COMPILE_TEST=y
  CONFIG_PCI_DRA7XX=y
  CONFIG_PCI_DRA7XX_HOST=y
  CONFIG_PCI_DRA7XX_EP=y
  # CONFIG_TI_PIPE3 is not set

So maybe there's a way to write these dependencies in a way that would
give us better compile-testing?

Bjorn

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 5ac021dbd46a..8b837b183981 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -376,7 +376,7 @@ config PCI_DRA7XX
 config PCI_DRA7XX_HOST
 	tristate "TI DRA7xx PCIe controller (host mode)"
 	depends on SOC_DRA7XX || COMPILE_TEST
-	depends on OF && HAS_IOMEM && TI_PIPE3
+	depends on OF && HAS_IOMEM
 	depends on PCI_MSI
 	select PCIE_DW_HOST
 	select PCI_DRA7XX
@@ -392,7 +392,7 @@ config PCI_DRA7XX_HOST
 config PCI_DRA7XX_EP
 	tristate "TI DRA7xx PCIe controller (endpoint mode)"
 	depends on SOC_DRA7XX || COMPILE_TEST
-	depends on OF && HAS_IOMEM && TI_PIPE3
+	depends on OF && HAS_IOMEM
 	depends on PCI_ENDPOINT
 	select PCIE_DW_EP
 	select PCI_DRA7XX

