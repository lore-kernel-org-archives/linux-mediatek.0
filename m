Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD0BC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:56:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE97920792
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3AfCF6Zk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqutHgQk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE97920792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nOpC8SrpnySExixK5Ed6qI+B+yfTvHQ6ZvHcmLE0aSg=; b=3AfCF6ZkIbm2l9KeF2q+4q/7K
	vylok0qAio02F4gJfRhPxOmz7RsF2vBPTQYG/Q/5hTxl3x+kS9akTZ9tnnZGFwp+j0tqT9oGWJw7d
	KeZTM4bzw+opl2DvPa2PHf5QFMD7gC3G083ew+8hy7GhSaHIzXaMIGrDRQ6OqwtwsbBrctDnYzVVX
	2tG01fsxswnDyF4eW8r6c+2dfy3gn7SpnTe2VBWCxuR5RPQhaZm4pvTlk36bArAbpoPObsNHfBKRe
	xoydXnqJCjuG1X2GMwVo3PN8rRiNhmpoMdvtoF4zccHXW7VKkl1+J0e6Dboadjo94QxRanI2eNn/X
	jWyZW39AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyeVw-0000Nu-1r; Thu, 23 Jul 2020 16:56:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeVs-0000N1-Fl; Thu, 23 Jul 2020 16:56:09 +0000
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0A3C20792;
 Thu, 23 Jul 2020 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595523367;
 bh=9qNrdyKreXu55OEnqmMFmaXouq8WzhxQTRQhDqKFzO0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pqutHgQkpjyinGndYtmIu84hrNe+/A0sgQFHclXeRy4KnStqsEjq5XbWm4DXu9Yru
 J+u5pJ3wHCYkh8RrX09cB8hI+obJ+Iu+5nr4o0hKaZK9tnKRQQell0iAFZdISIfCae
 H1aWUR95WJVl1NksWqCXqR3wwA829zTSwP5BK4B4=
Received: by mail-oi1-f169.google.com with SMTP id e4so5622280oib.1;
 Thu, 23 Jul 2020 09:56:07 -0700 (PDT)
X-Gm-Message-State: AOAM531xDl+v2z8HCHxaFaQR4/mzTF9IBIRnu4RPWuJpCEudlnoEndGk
 DypoJsOLfjPwkcot9q9w+L0HhMdaYzjLPoD9cQ==
X-Google-Smtp-Source: ABdhPJxlKZuS4ILTZ0+IoSoyVcDFqevHuf8OXw4KW6x7xfb5X7pMDe0Ld53HmKjmZM6D5msfxGLb+rIS+n0uKMrGU/A=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr4763076oif.106.1595523367119; 
 Thu, 23 Jul 2020 09:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200722022514.1283916-1-robh@kernel.org>
 <20200722022514.1283916-12-robh@kernel.org>
 <CAL_Jsq+sPaubVERLHaRzjvThk3zDO6zAnRQjGuAMKaVA87Y4HQ@mail.gmail.com>
 <20200723162148.GA11749@e121166-lin.cambridge.arm.com>
In-Reply-To: <20200723162148.GA11749@e121166-lin.cambridge.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Jul 2020 10:55:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFVuJGcCTgANF_R8EcvrTGw8WdOT1SDfAMSYrimGgKKQ@mail.gmail.com>
Message-ID: <CAL_JsqKFVuJGcCTgANF_R8EcvrTGw8WdOT1SDfAMSYrimGgKKQ@mail.gmail.com>
Subject: Re: [PATCH 11/19] PCI: Move setting pci_host_bridge.busnr out of host
 drivers
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_125608_654952_9CD8BAA7 
X-CRM114-Status: GOOD (  23.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 PCI <linux-pci@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 10:21 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Thu, Jul 23, 2020 at 09:26:01AM -0600, Rob Herring wrote:
> > On Tue, Jul 21, 2020 at 8:25 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > Most host drivers only parse the DT bus range to set the root bus number
> > > in pci_host_bridge.busnr. The ones that don't set busnr are buggy in
> > > that they ignore what's in DT. Let's set busnr in pci_scan_root_bus_bridge()
> > > where we already check for the bus resource and remove setting it in
> > > host drivers.
> > >
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Ryder Lee <ryder.lee@mediatek.com>
> > > Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Cc: linux-tegra@vger.kernel.org
> > > Cc: linux-mediatek@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 4 ----
> > >  drivers/pci/controller/dwc/pcie-designware.h      | 1 -
> > >  drivers/pci/controller/pci-aardvark.c             | 5 ++---
> > >  drivers/pci/controller/pci-host-common.c          | 1 -
> > >  drivers/pci/controller/pci-tegra.c                | 4 +---
> > >  drivers/pci/controller/pci-v3-semi.c              | 2 --
> > >  drivers/pci/controller/pcie-mediatek.c            | 8 +-------
> > >  drivers/pci/controller/pcie-rcar-host.c           | 1 -
> > >  drivers/pci/probe.c                               | 1 +
> > >  9 files changed, 5 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index 9e8a9cfc6d3a..fa922cb876a3 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -374,9 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
> > >                         pp->cfg0_base = pp->cfg->start;
> > >                         pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
> > >                         break;
> > > -               case IORESOURCE_BUS:
> > > -                       pp->busn = win->res;
> > > -                       break;
> > >                 }
> > >         }
> > >
> >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > index fd2146298b58..9fb44290ed43 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -188,7 +188,6 @@ struct pcie_port {
> > >         struct resource         *cfg;
> > >         struct resource         *io;
> > >         struct resource         *mem;
> > > -       struct resource         *busn;
> > >         int                     irq;
> > >         const struct dw_pcie_host_ops *ops;
> > >         int                     msi_irq;
> >
> > These 2 hunks should be dropped as they are breaking the Amazon driver.
> >
> > Lorenzo, do you want to fixup or I can send a fix?
>
> Done (I have not removed the hunk below though):

Right, that's correct. I'll post a separate patch removing 'pp->busn'
as that's available from the bridge struct. The bridge struct
surprisingly is not accessible from the DWC structs. I guess that's
why there's a bunch of duplication of data.

Rob

> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 9e8a9cfc6d3a..9775558acdc8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -474,7 +474,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>         }
>
>         bridge->sysdata = pp;
> -       bridge->busnr = pp->busn->start;
>         bridge->ops = &dw_pcie_ops;
>         bridge->map_irq = of_irq_parse_and_map_pci;
>         bridge->swizzle_irq = pci_common_swizzle;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
