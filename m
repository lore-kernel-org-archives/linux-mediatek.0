Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC18AC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 15:05:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0795604D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 15:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0795604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2R2Ut4UxJlZwQHsLJqxlGh6SnNBCcyZLjBWBkCDU/iE=; b=F5JLbad+RWvOyT
	I1cjKpC07KL7/ahpScfV6yXFFSkYdcnnnn2eQH2iZJ1btyQHKQsYQ9cAiQ9VJeEX+bPlhK/9bnO2X
	6ql4AsN3+mh4zm8zmGRUsFrI6ZHOZE1XIl2yHvJrX3Kh15k/9bxPcxXfXOg3gidbr0k7ohdQXZScl
	YibCChCwMHi3izw85uENzHdi9uJO5ZkQnQ5cBYwPpbjQlrDJLw0az9dWkKoc8N2+CcT1BdlUaFfAM
	a7eSHpCIXPziRmCPXf6HvaQcf6Z9i2YYz85drXAfwOFwzXFhEr82SNnYWgigemxY0Ct0VTAk4Ecky
	8+rQCV4F98H4RkEmuw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL5K0-002azQ-6S; Tue, 31 Aug 2021 15:05:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL5Jm-002axl-TU; Tue, 31 Aug 2021 15:04:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9572D6103D;
 Tue, 31 Aug 2021 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630422294;
 bh=C3Xs7RdGLh2cMdjlr/NAo11NY+tlBUiaZVO0ueTSglQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GS3gtkoeV4qXKwQmd4bUMERgedQrUWTuFxSyAzmC7v96oqJUPBR0o6fcwM1vCb3Qh
 isbVAVzB6yDvys72vXZdbHuZByy0ZLcTmKGrtb/QPVK0DPqUK6ME72GiLKjkW8Mt89
 eh7YpcgaQRDGaDm1Q2CCInQw18tKM0ovSQc41bZd5ZTzRmM68MDeDv/6oSkgUga+nD
 xgFT4puzZgUcQqdedzDKW/PY3Aaqfjl3+jXmlkq2xdH4nZgPLcy8nocTE9qxiyksXe
 fPx9IMtOfHfeRZo/DmhfSnfTooXK9rL4kArxThL3RyYX/QfUAjc3k+yyzFO23Ur0si
 eXCCt2qmaMO/w==
Received: by mail-ed1-f43.google.com with SMTP id eb14so18079377edb.8;
 Tue, 31 Aug 2021 08:04:54 -0700 (PDT)
X-Gm-Message-State: AOAM531RB7SyV5Ny5/TXKnsQ0ePU/Utu+mND7broYBIeVfrv1sFa7SHW
 VEApD0vNMOMysGUuf12SkYUtl3xgOSEB7CYjtQ==
X-Google-Smtp-Source: ABdhPJzIMc1+WNRGq8elp8WiVQQ/QZvEnHKttYUctX+V3p0QWutbb1xjXyyvrpXfsncygsOskBw3nTY6jXKx0zawpjs=
X-Received: by 2002:a50:eb8a:: with SMTP id y10mr30469814edr.137.1630422293211; 
 Tue, 31 Aug 2021 08:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210823032800.1660-3-chuanjia.liu@mediatek.com>
 <20210827164634.GA3779223@bjorn-Precision-5520>
In-Reply-To: <20210827164634.GA3779223@bjorn-Precision-5520>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 31 Aug 2021 10:04:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKEvAypWhiaWMhxM7zVkLAFL9=eMU7_vr=ht+uyxYe0qg@mail.gmail.com>
Message-ID: <CAL_JsqKEvAypWhiaWMhxM7zVkLAFL9=eMU7_vr=ht+uyxYe0qg@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] PCI: mediatek: Add new method to get shared
 pcie-cfg base address
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
 Yong Wu <yong.wu@mediatek.com>, PCI <linux-pci@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_080455_025621_9096B326 
X-CRM114-Status: GOOD (  32.40  )
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

On Fri, Aug 27, 2021 at 11:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:
> > For the new dts format, add a new method to get
> > shared pcie-cfg base address and use it to configure
> > the PCIECFG controller
>
> Rewrap this to fill 75 columns.
>
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index 25bee693834f..4296d9e04240 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/msi.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> > @@ -23,6 +24,7 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >  #include <linux/reset.h>
> >
> >  #include "../pci.h"
> > @@ -207,6 +209,7 @@ struct mtk_pcie_port {
> >   * struct mtk_pcie - PCIe host information
> >   * @dev: pointer to PCIe device
> >   * @base: IO mapped register base
> > + * @cfg: IO mapped register map for PCIe config
> >   * @free_ck: free-run reference clock
> >   * @mem: non-prefetchable memory resource
> >   * @ports: pointer to PCIe port information
> > @@ -215,6 +218,7 @@ struct mtk_pcie_port {
> >  struct mtk_pcie {
> >       struct device *dev;
> >       void __iomem *base;
> > +     struct regmap *cfg;
> >       struct clk *free_ck;
> >
> >       struct list_head ports;
> > @@ -682,6 +686,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >               val |= PCIE_CSR_LTSSM_EN(port->slot) |
> >                      PCIE_CSR_ASPM_L1_EN(port->slot);
> >               writel(val, pcie->base + PCIE_SYS_CFG_V2);
> > +     } else if (pcie->cfg) {
> > +             val = PCIE_CSR_LTSSM_EN(port->slot) |
> > +                   PCIE_CSR_ASPM_L1_EN(port->slot);
> > +             regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
> >       }
> >
> >       /* Assert all reset signals */
> > @@ -985,6 +993,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> >       struct device *dev = pcie->dev;
> >       struct platform_device *pdev = to_platform_device(dev);
> >       struct resource *regs;
> > +     struct device_node *cfg_node;
> >       int err;
> >
> >       /* get shared registers, which are optional */
> > @@ -995,6 +1004,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> >                       return PTR_ERR(pcie->base);
> >       }
> >
> > +     cfg_node = of_find_compatible_node(NULL, NULL,
> > +                                        "mediatek,generic-pciecfg");
>
> This looks wrong to me.  IIUC, since we start at NULL, this searches
> the entire device tree for any node with
>
>   compatible = "mediatek,generic-pciecfg"
>
> but we should only care about the specific device/node this driver
> claimed.
>
> Should this be part of the match data, i.e., struct mtk_pcie_soc?

What would you put in match data exactly?

The other way to do this is to have a DT property with the phandle
which people like to do (have everything in the node 'for their
driver'). If there's only 1 possible node (which is almost always the
case), then there is little benefit to having another property. It's
just redundant data. A phandle lookup might be a bit faster with the
caching we do, but on a miss it would still walk all nodes.

The other thing with these 'extra register bits to twiddle' is that
they tend to be SoC specific and change from chip to chip, so either
way is not very portable. The real question to ask is should there be
a standard interface used or created.

>
> > +     if (cfg_node) {
> > +             pcie->cfg = syscon_node_to_regmap(cfg_node);
>
> Other drivers in drivers/pci/controller/ use
> syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
> layerscape, artpec6) or syscon_regmap_lookup_by_compatible() (imx6,
> kirin, v3-semi).

There's no phandle to use in this case. As above, I'm trying to break
people of this habit.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
