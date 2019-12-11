Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759FEC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 09:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43ECE205C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 09:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcAOxQJt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLLj9CbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43ECE205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfnSuhAhet37GTE4y7dJ51A9VdQEZtZAhK2DXEqfKss=; b=rcAOxQJtM+WoAh
	vlm9E+LIhjBbCwleD9T3QXCOQfg/PgwXiVhlfeXTRzlgXsjXCqPC0d5fFkamnoUv3BixebcOOKpzX
	mQypXrkYNrgIjcDIMshtQnooZrtvEqmmAYLBdRDf/wRrweXUdjHgNwdgQjQ2ChCFIdO2iW/CBDzq7
	3D6GjleyZbAl6mK7KFPoTdknlUqrsdRTfo7NL7I+/n1bsiloP3fm9BFNFaCs+Lf64/vYYuxgfp5az
	0MaV40CCSIvUG1aGvGB2Tut3wQrZ969OF5BI4pKqgqRaaDneY+qmfyYVQN7h1Ng9/ulw1Ypb7Q4py
	h6DCkAA5mlrI3X2XO3GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieyTT-00087J-7x; Wed, 11 Dec 2019 09:40:03 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieyTC-0007ux-CX; Wed, 11 Dec 2019 09:39:48 +0000
Received: by mail-qt1-x842.google.com with SMTP id t17so5695142qtr.7;
 Wed, 11 Dec 2019 01:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CjOlmYhRmkaSajOcDzUsQHVQEAzmRdkGoUqWj7Hj31Q=;
 b=ZLLj9CbSg/GS5+gx8BKlj96gCnk0AuQ9C57BErPXBqXj15WCYYPHh7I1CfWv/xgf62
 3BNP5tJ2FAihqpwHVtqGnBR3CdBrYdI/7gQVm+OWj8sN33GFptmpxj3Tm5otNKlRjkLC
 xp1wXNKZBildqQOsKxlg/rHZI3vGtZZkWc1j04eVd+MU2NNojYWUBZ5KEg6yMS2lotZi
 J31lOoYZb3lqjHrYw61b49FlNUQHwpPl95HwygGg+0PiJ8F3b6z9fOBareT3i6ylBXBC
 svzN4YAYrhg3Cb3+RHnwUPaLdMPc6RBEWsnuDExl0hhRzxc5sDHIMgLt6BLdT/r0tx4/
 by/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CjOlmYhRmkaSajOcDzUsQHVQEAzmRdkGoUqWj7Hj31Q=;
 b=pYX+E+RekUa990NBcTR/1oNCv45cYVKXVvkukM4XFI4i3sYDB4nEq0DPM1cvbjssno
 05kLcdjQ3JQLuR3z/RUXmmMud3Mz6wGlk4qfcLzXDgtpRICg0TX7ECLoTjXOzjQNIOsC
 4JtuFnI13+nSBitPjvSKMFlXeA28kQjf2bDKHbYQ599V0JgaSPBjAKk7Itvl5O6IzRKY
 XQGIvQ40u2GJKYiD6lzldOAIqkyKLUc7PSrOaVMPPL1XKpjWGeVN9WqnanfoLq1osvrW
 MKAHLeNZdvEYbFmkQfWUNMhHOs1W2w2xb83Nd9iG/LQWym2fAq9Mblpoef2K9FvHxHmS
 2hWg==
X-Gm-Message-State: APjAAAXG1jk2IqgZtVleTcY05TFGPIVmkt4Ls5WSa+iMjEOksTnV5c/l
 QRlHj5xt40BAAPi+OVs9B7QMNVjNoG8TRvVAcKk=
X-Google-Smtp-Source: APXvYqzctDU+DSt+DTuT6Z7HBvXZlDEvR8lC3YYDN3W5/5sDi7FAGVJpDh7gpxqSzgJu0VrZj70D6iIZ/qSYOpqN+xQ=
X-Received: by 2002:aed:3fb7:: with SMTP id s52mr1850574qth.311.1576057183242; 
 Wed, 11 Dec 2019 01:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20191028163256.8004-1-robh@kernel.org>
 <20191028163256.8004-12-robh@kernel.org>
 <20191206153633.GA18142@e121166-lin.cambridge.arm.com>
 <CAFqH_53nX74vD6-T2ao0x540wq_NbN671H5i2fwbo6NaCgc4KQ@mail.gmail.com>
In-Reply-To: <CAFqH_53nX74vD6-T2ao0x540wq_NbN671H5i2fwbo6NaCgc4KQ@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 11 Dec 2019 10:39:31 +0100
Message-ID: <CAFqH_51R3K5ncmwC7r4VUnXzkmoc9xqfbsTTWH_7+GoSiQLRQg@mail.gmail.com>
Subject: Re: [PATCH v3 11/25] PCI: rockchip: Drop storing driver private
 outbound resource data
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_013946_430011_7075F70B 
X-CRM114-Status: GOOD (  25.23  )
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
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Michal Simek <michal.simek@xilinx.com>, Christoph Hellwig <hch@infradead.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Lin <shawn.lin@rock-chips.com>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Simon Horman <horms@verge.net.au>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org,
 Tom Joseph <tjoseph@cadence.com>, Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Missatge de Enric Balletbo Serra <eballetbo@gmail.com> del dia dt., 10
de des. 2019 a les 18:33:
>
> Hi Lorenzo,
>
> Many thanks to look at this.
>
> Missatge de Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> del dia dv.,
> 6 de des. 2019 a les 16:36:
> >
> > [+Eric]
> >
> > On Mon, Oct 28, 2019 at 11:32:42AM -0500, Rob Herring wrote:
> > > The Rockchip host bridge driver doesn't need to store outboard resources
> > > in its private struct as they are already stored in struct
> > > pci_host_bridge.
> > >
> > > Cc: Shawn Lin <shawn.lin@rock-chips.com>
> > > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > Cc: Andrew Murray <andrew.murray@arm.com>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: linux-rockchip@lists.infradead.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  drivers/pci/controller/pcie-rockchip-host.c | 54 +++++++++------------
> > >  drivers/pci/controller/pcie-rockchip.h      |  5 --
> > >  2 files changed, 23 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> > > index 8d2e6f2e141e..f375e55ea02e 100644
> > > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > > @@ -806,19 +806,28 @@ static int rockchip_pcie_prog_ib_atu(struct rockchip_pcie *rockchip,
> > >  static int rockchip_pcie_cfg_atu(struct rockchip_pcie *rockchip)
> > >  {
> > >       struct device *dev = rockchip->dev;
> > > +     struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rockchip);
> > > +     struct resource_entry *entry;
> > > +     u64 pci_addr, size;
> > >       int offset;
> > >       int err;
> > >       int reg_no;
> > >
> > >       rockchip_pcie_cfg_configuration_accesses(rockchip,
> > >                                                AXI_WRAPPER_TYPE0_CFG);
> > > +     entry = resource_list_first_type(&bridge->windows, IORESOURCE_MEM);
> > > +     if (!entry)
> > > +             return -ENODEV;
> > > +
> > > +     size = resource_size(entry->res);
> > > +     pci_addr = entry->res->start - entry->offset;
> > > +     rockchip->msg_bus_addr = pci_addr;
> > >
> > > -     for (reg_no = 0; reg_no < (rockchip->mem_size >> 20); reg_no++) {
> > > +     for (reg_no = 0; reg_no < (size >> 20); reg_no++) {
> > >               err = rockchip_pcie_prog_ob_atu(rockchip, reg_no + 1,
> > >                                               AXI_WRAPPER_MEM_WRITE,
> > >                                               20 - 1,
> > > -                                             rockchip->mem_bus_addr +
> > > -                                             (reg_no << 20),
> > > +                                             pci_addr + (reg_no << 20),
> > >                                               0);
> > >               if (err) {
> > >                       dev_err(dev, "program RC mem outbound ATU failed\n");
> > > @@ -832,14 +841,20 @@ static int rockchip_pcie_cfg_atu(struct rockchip_pcie *rockchip)
> > >               return err;
> > >       }
> > >
> > > -     offset = rockchip->mem_size >> 20;
> > > -     for (reg_no = 0; reg_no < (rockchip->io_size >> 20); reg_no++) {
> > > +     entry = resource_list_first_type(&bridge->windows, IORESOURCE_IO);
> > > +     if (!entry)
> > > +             return -ENODEV;
> > > +
> > > +     size = resource_size(entry->res);
> > > +     pci_addr = entry->res->start - entry->offset;
> > > +
> > > +     offset = size >> 20;
> >
> > Just trying to find what triggers:
> >
> > https://lore.kernel.org/linux-pci/CAFqH_52BiQJzNEzd_0pB3K+JmzVOVikYQo0xfiC0J-DwiXdtqw@mail.gmail.com/T/#u
> >
> > I think this offset calculation changed the behaviour:
> >
> > Before:
> >
> > > -     offset = rockchip->mem_size >> 20;
> >
> > Now:
> >
> > > +     offset = size >> 20;
> >
> > size must be the IORESOURCE_MEM resource size instead we are using the
> > IORESOURCE_IO size so IIUC the ATU window setup may be compromised.
> >
>
> Are you suggesting that something like this [1] fixes the issue?
>
> Indeed,I don't see the warning with this applied and wifi which is
> connected via pcie is working. But I don't get why the offset should
> be from the MEM resource instead of the IO resource.
>
> [1] https://pastebin.com/FBj95gNR
>

I think I understood, so I send a fix [2] for this

[2] https://lkml.org/lkml/2019/12/11/199

Thanks,
 Enric

> Thanks,
>  Enric
>
> > Lorenzo
> >
> > > +     for (reg_no = 0; reg_no < (size >> 20); reg_no++) {
> > >               err = rockchip_pcie_prog_ob_atu(rockchip,
> > >                                               reg_no + 1 + offset,
> > >                                               AXI_WRAPPER_IO_WRITE,
> > >                                               20 - 1,
> > > -                                             rockchip->io_bus_addr +
> > > -                                             (reg_no << 20),
> > > +                                             pci_addr + (reg_no << 20),
> > >                                               0);
> > >               if (err) {
> > >                       dev_err(dev, "program RC io outbound ATU failed\n");
> > > @@ -852,8 +867,7 @@ static int rockchip_pcie_cfg_atu(struct rockchip_pcie *rockchip)
> > >                                 AXI_WRAPPER_NOR_MSG,
> > >                                 20 - 1, 0, 0);
> > >
> > > -     rockchip->msg_bus_addr = rockchip->mem_bus_addr +
> > > -                                     ((reg_no + offset) << 20);
> > > +     rockchip->msg_bus_addr += ((reg_no + offset) << 20);
> > >       return err;
> > >  }
> > >
> > > @@ -951,7 +965,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> > >       struct pci_bus *bus, *child;
> > >       struct pci_host_bridge *bridge;
> > >       struct resource *bus_res;
> > > -     struct resource_entry *win;
> > >       int err;
> > >
> > >       if (!dev->of_node)
> > > @@ -997,27 +1010,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> > >
> > >       rockchip->root_bus_nr = bus_res->start;
> > >
> > > -     /* Get the I/O and memory ranges from DT */
> > > -     resource_list_for_each_entry(win, &bridge->windows) {
> > > -             switch (resource_type(win->res)) {
> > > -             case IORESOURCE_IO:
> > > -                     io = win->res;
> > > -                     io->name = "I/O";
> > > -                     rockchip->io_size = resource_size(io);
> > > -                     rockchip->io_bus_addr = io->start - win->offset;
> > > -                     rockchip->io = io;
> > > -                     break;
> > > -             case IORESOURCE_MEM:
> > > -                     mem = win->res;
> > > -                     mem->name = "MEM";
> > > -                     rockchip->mem_size = resource_size(mem);
> > > -                     rockchip->mem_bus_addr = mem->start - win->offset;
> > > -                     break;
> > > -             default:
> > > -                     continue;
> > > -             }
> > > -     }
> > > -
> > >       err = rockchip_pcie_cfg_atu(rockchip);
> > >       if (err)
> > >               goto err_remove_irq_domain;
> > > diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> > > index 8e87a059ce73..bef42a803b56 100644
> > > --- a/drivers/pci/controller/pcie-rockchip.h
> > > +++ b/drivers/pci/controller/pcie-rockchip.h
> > > @@ -304,13 +304,8 @@ struct rockchip_pcie {
> > >       struct  irq_domain *irq_domain;
> > >       int     offset;
> > >       struct pci_bus *root_bus;
> > > -     struct resource *io;
> > > -     phys_addr_t io_bus_addr;
> > > -     u32     io_size;
> > >       void    __iomem *msg_region;
> > > -     u32     mem_size;
> > >       phys_addr_t msg_bus_addr;
> > > -     phys_addr_t mem_bus_addr;
> > >       bool is_rc;
> > >       struct resource *mem_res;
> > >  };
> > > --
> > > 2.20.1
> > >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
