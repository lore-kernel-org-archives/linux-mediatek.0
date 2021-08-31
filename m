Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74903C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 18:24:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C01B60FE8
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 18:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C01B60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aR+2jg223HsQu6AajttLZz4lP+UWGkh7cFAqgFBiQrA=; b=MWLkQPp72IPO7A
	JnlJP2ZDT4+jbzW8UOXd25Xt4GIDldoXTvi0kUN6R6AY3U5u7cpQytT/y4qwjbNXxH68guvC3Nvi9
	APugmVHDlwnjCPT2NeF95tLIzur8IJpkpiwc+lvQ3CFr+1zZ595W3xY8kDcWzrYkSig/irU5cwJ8U
	Kr2bJWgCJEozh36l613su107yikDqJEqjQb2xST+VAG62FXX0OrQ75/KsAcz6bzCLBR2McKEkrffu
	wAtJokAv8YdRRQDY9S44117KSTcsomRcTZHmkR4YOeBsvKWbkh6Iv3VKVEexAYiFjwdBlY1k5bJt/
	GkawMl36Sy8V6YY5Pkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL8R2-002ufZ-KT; Tue, 31 Aug 2021 18:24:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL8Qo-002ueD-Tf; Tue, 31 Aug 2021 18:24:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 875A261056;
 Tue, 31 Aug 2021 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630434262;
 bh=JppPB/r91xiHliv4KMyg+e4WdWnb/md7Nq5OwRDXCJQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lM3iIqS0bv/TZAayziHSuifgl2v9HezM8iyfdyKEjuSdK2EPbRzrin7MzBre7U+ow
 ZsMwfMS7DSxzWhm6UFMVDOp3/L+OqlsHDRhQhiMNj2C2XcTXfdzJpUs+Y1EnnoJDMv
 OlV+MLef2DrOFUQG9m4kfBSLNlVIdIvV5wRomvHA2EPxUoq71cIYhDG+K+DxdxjZJA
 GRibCKFSOpqzYumk7jGDlDQgyLRVM69YR/pyXFeZjbq5OHIJyEYv/M0kQ9BIBR+9su
 hE+KLqybUKR1q9ywtSEyOiJ2bhperswXQxa4Wz/vqDv0TK+A0vnbNCP5mUmsayhoUC
 9YLGnaPWMOhLA==
Received: by mail-ej1-f43.google.com with SMTP id u3so835279ejz.1;
 Tue, 31 Aug 2021 11:24:22 -0700 (PDT)
X-Gm-Message-State: AOAM533lGI/lj1Pnee4kDDkzVQsxi5udr6ollchjq5YcVz5QxZ1L4V3i
 wn9Q08esT4aj04qgrKbQ/MwbxZDkwkQ3biIdFQ==
X-Google-Smtp-Source: ABdhPJx0bWUTQpVcwF3zUZB8CpqetIM2G7wA1PzLMXQI4MWCrkFokKMqKxjrdpW/NUMoT4LNfTTn7o0aQrfDcpk04lI=
X-Received: by 2002:a17:907:b06:: with SMTP id
 h6mr30094347ejl.130.1630434261057; 
 Tue, 31 Aug 2021 11:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_JsqKEvAypWhiaWMhxM7zVkLAFL9=eMU7_vr=ht+uyxYe0qg@mail.gmail.com>
 <20210831154711.GA107126@bjorn-Precision-5520>
In-Reply-To: <20210831154711.GA107126@bjorn-Precision-5520>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 31 Aug 2021 13:24:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+y=-UTv6B5cGG5p-q-rzzyEuWZ_Q6YKPT=Jej1boZwjQ@mail.gmail.com>
Message-ID: <CAL_Jsq+y=-UTv6B5cGG5p-q-rzzyEuWZ_Q6YKPT=Jej1boZwjQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210831_112423_042576_60D53A02 
X-CRM114-Status: GOOD (  44.84  )
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

On Tue, Aug 31, 2021 at 10:47 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Aug 31, 2021 at 10:04:40AM -0500, Rob Herring wrote:
> > On Fri, Aug 27, 2021 at 11:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:
> > > > For the new dts format, add a new method to get
> > > > shared pcie-cfg base address and use it to configure
> > > > the PCIECFG controller
> > >
> > > Rewrap this to fill 75 columns.
> > >
> > > > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > > > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > > > ---
> > > >  drivers/pci/controller/pcie-mediatek.c | 17 +++++++++++++++++
> > > >  1 file changed, 17 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > > index 25bee693834f..4296d9e04240 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <linux/irqchip/chained_irq.h>
> > > >  #include <linux/irqdomain.h>
> > > >  #include <linux/kernel.h>
> > > > +#include <linux/mfd/syscon.h>
> > > >  #include <linux/msi.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/of_address.h>
> > > > @@ -23,6 +24,7 @@
> > > >  #include <linux/phy/phy.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/regmap.h>
> > > >  #include <linux/reset.h>
> > > >
> > > >  #include "../pci.h"
> > > > @@ -207,6 +209,7 @@ struct mtk_pcie_port {
> > > >   * struct mtk_pcie - PCIe host information
> > > >   * @dev: pointer to PCIe device
> > > >   * @base: IO mapped register base
> > > > + * @cfg: IO mapped register map for PCIe config
> > > >   * @free_ck: free-run reference clock
> > > >   * @mem: non-prefetchable memory resource
> > > >   * @ports: pointer to PCIe port information
> > > > @@ -215,6 +218,7 @@ struct mtk_pcie_port {
> > > >  struct mtk_pcie {
> > > >       struct device *dev;
> > > >       void __iomem *base;
> > > > +     struct regmap *cfg;
> > > >       struct clk *free_ck;
> > > >
> > > >       struct list_head ports;
> > > > @@ -682,6 +686,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> > > >               val |= PCIE_CSR_LTSSM_EN(port->slot) |
> > > >                      PCIE_CSR_ASPM_L1_EN(port->slot);
> > > >               writel(val, pcie->base + PCIE_SYS_CFG_V2);
> > > > +     } else if (pcie->cfg) {
> > > > +             val = PCIE_CSR_LTSSM_EN(port->slot) |
> > > > +                   PCIE_CSR_ASPM_L1_EN(port->slot);
> > > > +             regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
> > > >       }
> > > >
> > > >       /* Assert all reset signals */
> > > > @@ -985,6 +993,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> > > >       struct device *dev = pcie->dev;
> > > >       struct platform_device *pdev = to_platform_device(dev);
> > > >       struct resource *regs;
> > > > +     struct device_node *cfg_node;
> > > >       int err;
> > > >
> > > >       /* get shared registers, which are optional */
> > > > @@ -995,6 +1004,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> > > >                       return PTR_ERR(pcie->base);
> > > >       }
> > > >
> > > > +     cfg_node = of_find_compatible_node(NULL, NULL,
> > > > +                                        "mediatek,generic-pciecfg");
> > >
> > > This looks wrong to me.  IIUC, since we start at NULL, this searches
> > > the entire device tree for any node with
> > >
> > >   compatible = "mediatek,generic-pciecfg"
> > >
> > > but we should only care about the specific device/node this driver
> > > claimed.
> > >
> > > Should this be part of the match data, i.e., struct mtk_pcie_soc?
> >
> > What would you put in match data exactly?
> >
> > The other way to do this is to have a DT property with the phandle
> > which people like to do (have everything in the node 'for their
> > driver'). If there's only 1 possible node (which is almost always the
> > case), then there is little benefit to having another property. It's
> > just redundant data. A phandle lookup might be a bit faster with the
> > caching we do, but on a miss it would still walk all nodes.
> >
> > The other thing with these 'extra register bits to twiddle' is that
> > they tend to be SoC specific and change from chip to chip, so either
> > way is not very portable. The real question to ask is should there be
> > a standard interface used or created.
> >
> > > > +     if (cfg_node) {
> > > > +             pcie->cfg = syscon_node_to_regmap(cfg_node);
> > >
> > > Other drivers in drivers/pci/controller/ use
> > > syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
> > > layerscape, artpec6) or syscon_regmap_lookup_by_compatible() (imx6,
> > > kirin, v3-semi).
> >
> > There's no phandle to use in this case. As above, I'm trying to break
> > people of this habit.
>
> Thanks!  I was mistaken in lots of ways here.  I first assumed
> "mediatek,generic-pciecfg" was local to the pcie node, but that's not
> true.  Then I thought there might be an ownership issue because the
> regmap is not local to the device, and several drivers look up and use
> the same regmap.  But it looks like regmap provides some internal
> locking which mitigates most or all of that concern.
>
> Just to check -- you prefer syscon_regmap_lookup_by_compatible() over
> syscon_regmap_lookup_by_phandle()?

Yes, unless there is either more than 1 instance of the syscon or some
additional data specific to the user (e.g. a register offset).

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
