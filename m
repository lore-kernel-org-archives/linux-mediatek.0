Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC4FC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:22:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84466206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTmYUOT/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84466206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G1Bc1pl4l6cPw5MqEnNsFlNuGunyizMA1CzAZjcrMaM=; b=DTmYUOT/zYKd9nFUIgE7aMHJ+
	Kb6AhsYW8ZxM2LsmgcsjDvvEkJ/MSk8ku/urvoHJEZ3PB8+ErSImLQz7X8IumM2pXLxspvwAncBfl
	Fni3+AKn5pl8p3CvaAgv2m7I3V7ASsTPSHwgWNU0Kv6sUr4BUJVt+WG/Zx7h0066aOGLbAwqO4VSm
	tl9XWuNx0T4c5ubq3D7ZSHP3i9Pr2Q0Ka+h36Xv9jc0F1AGm1vjMOCLndtNc2C+mNbNuN9q8iNu+s
	TjYf/XgathT6mTlT98MumEmc0Sgy57fZI80H56vgRPR53g4FWvAPHfakH2I2qvnRvY4QaHVtYHP2b
	gIjPvyoUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydyu-0002RR-MA; Thu, 23 Jul 2020 16:22:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydyq-0002Pn-6g; Thu, 23 Jul 2020 16:22:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B1BA1FB;
 Thu, 23 Jul 2020 09:21:57 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CC683F66F;
 Thu, 23 Jul 2020 09:21:53 -0700 (PDT)
Date: Thu, 23 Jul 2020 17:21:48 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/19] PCI: Move setting pci_host_bridge.busnr out of
 host drivers
Message-ID: <20200723162148.GA11749@e121166-lin.cambridge.arm.com>
References: <20200722022514.1283916-1-robh@kernel.org>
 <20200722022514.1283916-12-robh@kernel.org>
 <CAL_Jsq+sPaubVERLHaRzjvThk3zDO6zAnRQjGuAMKaVA87Y4HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+sPaubVERLHaRzjvThk3zDO6zAnRQjGuAMKaVA87Y4HQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_122200_348312_2473CC1F 
X-CRM114-Status: GOOD (  20.99  )
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

On Thu, Jul 23, 2020 at 09:26:01AM -0600, Rob Herring wrote:
> On Tue, Jul 21, 2020 at 8:25 PM Rob Herring <robh@kernel.org> wrote:
> >
> > Most host drivers only parse the DT bus range to set the root bus number
> > in pci_host_bridge.busnr. The ones that don't set busnr are buggy in
> > that they ignore what's in DT. Let's set busnr in pci_scan_root_bus_bridge()
> > where we already check for the bus resource and remove setting it in
> > host drivers.
> >
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Ryder Lee <ryder.lee@mediatek.com>
> > Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: linux-tegra@vger.kernel.org
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 4 ----
> >  drivers/pci/controller/dwc/pcie-designware.h      | 1 -
> >  drivers/pci/controller/pci-aardvark.c             | 5 ++---
> >  drivers/pci/controller/pci-host-common.c          | 1 -
> >  drivers/pci/controller/pci-tegra.c                | 4 +---
> >  drivers/pci/controller/pci-v3-semi.c              | 2 --
> >  drivers/pci/controller/pcie-mediatek.c            | 8 +-------
> >  drivers/pci/controller/pcie-rcar-host.c           | 1 -
> >  drivers/pci/probe.c                               | 1 +
> >  9 files changed, 5 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 9e8a9cfc6d3a..fa922cb876a3 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -374,9 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >                         pp->cfg0_base = pp->cfg->start;
> >                         pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
> >                         break;
> > -               case IORESOURCE_BUS:
> > -                       pp->busn = win->res;
> > -                       break;
> >                 }
> >         }
> >
> 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index fd2146298b58..9fb44290ed43 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -188,7 +188,6 @@ struct pcie_port {
> >         struct resource         *cfg;
> >         struct resource         *io;
> >         struct resource         *mem;
> > -       struct resource         *busn;
> >         int                     irq;
> >         const struct dw_pcie_host_ops *ops;
> >         int                     msi_irq;
> 
> These 2 hunks should be dropped as they are breaking the Amazon driver.
> 
> Lorenzo, do you want to fixup or I can send a fix?

Done (I have not removed the hunk below though):

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9e8a9cfc6d3a..9775558acdc8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -474,7 +474,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	}

 	bridge->sysdata = pp;
-	bridge->busnr = pp->busn->start;
 	bridge->ops = &dw_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
