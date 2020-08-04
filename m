Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0500C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:13:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85AA2086A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2w00xPQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9l0CpSr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C85AA2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QyPf/pgPh4UX9zWlV3WJOMwF1CDXQENMIkIBoDYlKkE=; b=Z2w00xPQnKRqwuQPpTh5sZhWj
	ryUZJb9oFXmlKLrdzsrB9UtIsCGpHTTdrEWWVJePlIYgIDCTzxJArMMJ4kRsxM2P4piSNvx9sANbJ
	X9Syfik9u7oNCzwpm2hKdmKXt0KEbvuzoqOa57QhfZQGmvcm+0qq2dkVne9BeOQVTXt2iMR4jX732
	ihJV22HT+9z+j2oT0CV+fsmUTYtC5/YKyd4lvDnDlkPz763VGHomGPSG2M6kXfssGWWZqjq9o3c1V
	ZUC6f8tN22w/YI52uWogGMXVYYkArsamdyra+pCMUI4KsercYg2DLNvy7z0SDaXiCDugNsoFunolJ
	ijVWP17jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2yd5-0004k2-Vl; Tue, 04 Aug 2020 15:13:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2yd1-0004jH-9X; Tue, 04 Aug 2020 15:13:24 +0000
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E40C2086A;
 Tue,  4 Aug 2020 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596554002;
 bh=/VyvzXQa/AJF0fQ8y2ddiypbwJGanvNQVpDg2wnRSkc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l9l0CpSrSvdSa/Qnx0M3n/vm5miZOV4bmDR03DhH63U8LBX2NaP+P48yoU/RCbNF+
 cbFrToSIsIm6Z5sgQ5lIiPy/CUaZdnRqX1LKhBRC/cKJeGNsHz8Ugq8mLVc7zKhYiB
 Naa406WtrytIAa9/NRux8kc19hNGiRqQgP4KHze0=
Received: by mail-ot1-f44.google.com with SMTP id v6so20034996ota.13;
 Tue, 04 Aug 2020 08:13:22 -0700 (PDT)
X-Gm-Message-State: AOAM533zJDRAwrVY6bHOvi2oaDVcptRdZr/2pBet08LrVCrdsF2aUTrg
 0O8Qexwrge7GUiYx1XY6xePJlTChw4TW4vWiuA==
X-Google-Smtp-Source: ABdhPJxh9dJbSLfU6Nwv/yJMmnpLPR54KOz7EmmOkgm7Ly+4ylRFpnDySUtwPNVJNs/aSiEi9+iiHmUJSMEt/gWTgiQ=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr17121176ote.107.1596554001883; 
 Tue, 04 Aug 2020 08:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200722022514.1283916-1-robh@kernel.org>
 <20200722022514.1283916-18-robh@kernel.org>
 <CAMuHMdWVWoQDc3MMv9LjA+hA1EoXQjVM-JfO_hVqnDf0tC8LJg@mail.gmail.com>
In-Reply-To: <CAMuHMdWVWoQDc3MMv9LjA+hA1EoXQjVM-JfO_hVqnDf0tC8LJg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Aug 2020 09:13:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+6Xcf5KT1Db5mGFWr9E04Jd8Rx4aVJpUmfUT8hPmtqBg@mail.gmail.com>
Message-ID: <CAL_Jsq+6Xcf5KT1Db5mGFWr9E04Jd8Rx4aVJpUmfUT8hPmtqBg@mail.gmail.com>
Subject: Re: [PATCH 17/19] PCI: rcar-gen2: Convert to use modern host bridge
 probe functions
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_111323_464834_3C9F8300 
X-CRM114-Status: GOOD (  33.53  )
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
 linux-pci <linux-pci@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2020 at 6:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Wed, Jul 22, 2020 at 4:26 AM Rob Herring <robh@kernel.org> wrote:
> > The rcar-gen2 host driver still uses the old Arm PCI setup function
> > pci_common_init_dev(). Let's update it to use the modern
> > devm_pci_alloc_host_bridge(), pci_parse_request_of_pci_ranges() and
> > pci_host_probe() functions.
> >
> > Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> This is now commit 92d69cc6275845a7 ("PCI: rcar-gen2: Convert to use
> modern host bridge probe functions"), and causes a crash on r8a7791/koelsch:

Can't say I'm surprised, this was a big change. Thanks for testing.


>     Unable to handle kernel NULL pointer dereference at virtual address 00000008
>     pgd = (ptrval)
>     [00000008] *pgd=00000000
>     Internal error: Oops: 5 [#1] SMP ARM
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.8.0-rc1-shmobile-00035-g92d69cc6275845a7 #645
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     PC is at rcar_pci_probe+0x154/0x340
>     LR is at _raw_spin_unlock_irqrestore+0x18/0x20
>
> > --- a/drivers/pci/controller/pci-rcar-gen2.c
> > +++ b/drivers/pci/controller/pci-rcar-gen2.c
> > @@ -189,19 +170,33 @@ static inline void rcar_pci_setup_errirq(struct rcar_pci_priv *priv) { }
> >  #endif
> >
> >  /* PCI host controller setup */
> > -static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
> > +static void rcar_pci_setup(struct rcar_pci_priv *priv)
> >  {
> > -       struct rcar_pci_priv *priv = sys->private_data;
> > +       struct pci_host_bridge *bridge = pci_host_bridge_from_priv(priv);
> >         struct device *dev = priv->dev;
> >         void __iomem *reg = priv->reg;
> > +       struct resource_entry *entry;
> > +       unsigned long window_size;
> > +       unsigned long window_addr;
> > +       unsigned long window_pci;
> >         u32 val;
> > -       int ret;
> > +
> > +       entry = resource_list_first_type(&bridge->dma_ranges, IORESOURCE_MEM);
>
> bridge->dma_ranges is not initialized => BOOM.
>
> >  static int rcar_pci_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> >         struct resource *cfg_res, *mem_res;
> >         struct rcar_pci_priv *priv;
> > +       struct pci_host_bridge *bridge;
> >         void __iomem *reg;
> > -       struct hw_pci hw;
> > -       void *hw_private[1];
> > +       int ret;
> > +
> > +       bridge = devm_pci_alloc_host_bridge(dev, sizeof(*priv));
> > +       if (!bridge)
> > +               return -ENOMEM;
> > +
> > +       priv = pci_host_bridge_priv(bridge);
>
> This is the "new" priv instance.
>
> > +       bridge->sysdata = priv;
> >
> >         cfg_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         reg = devm_ioremap_resource(dev, cfg_res);
>
> However, the "old" instance is still allocated below, and should be removed.
>
> I've send a patch to fix that, which should appear soon at
> https://lore.kernel.org/r/20200804120430.9253-1-geert+renesas@glider.be
>
> BTW, the conversion has the following impact on r8a7791/koelsch:
>
>     -pci-rcar-gen2 ee090000.pci: PCI: bus0 revision 11
>     +pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 ranges:
>     +pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee08ffff
> -> 0x00ee080000
>     +pci-rcar-gen2 ee090000.pci: PCI: revision 11
>      pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
>     -pci_bus 0000:00: root bus resource [mem 0xee080000-0xee0810ff]
>                                              ^^^^^^^^^^^^^^^^^^^^^
>     -pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
>     +pci_bus 0000:00: root bus resource [bus 00]
>     +pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08ffff]
>                                              ^^^^^^^^^^^^^^^^^^^^^
>
>     pci0: pci@ee090000 {
>             ...
>             reg = <0 0xee090000 0 0xc00>,
>                   <0 0xee080000 0 0x1100>;
>             ...
>             ranges = <0x02000000 0 0xee080000 0 0xee080000 0 0x00010000>;
>             ...
>             usb@1,0 {
>                     reg = <0x800 0 0 0 0>;
>                     ...
>             };
>
>             usb@2,0 {
>                     reg = <0x1000 0 0 0 0>;
>                     ...
>             };
>
>     }
>
> The old root bus resource size was based on the "reg" property.
> The new root bus resource size is based on the "ranges" property.

That was wrong to have PCI memory space in 'reg', but the driver could
always adjust the size to 0x1100 if needed.

BTW, the binding description seems to have the 'reg' description reversed.

> Given the only children are hardcoded, I guess that is OK?

In the sense that those are the only 2 devices and you know their
memory fits, yes. However, the memory space itself isn't hardcoded. If
you wanted to do that, then the children really need
'assigned-addresses' properties. I guess it happens to work because
memory space is allocated from the start and goes in order of device
addresses. But if that changed to top down allocation?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
