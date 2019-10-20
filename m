Return-Path: <SRS0=pnE3=YN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33727CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2019 21:40:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7FCE21929
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2019 21:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFWV9LTI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+vGSyU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7FCE21929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZhtH7M2Wi7kNBRG+hrpTzGGqrZawVsraI+Hqvo+cI8=; b=cFWV9LTIlTN1oy
	X3ZGNNqWvA9GamDf7m4/8INSSHbyy+YnJXltLb9I2Tos1M4w5P608ZwUCMcBAhrL7AtYCSxrBPujt
	8Z0bqDIoB5SdUV0Oz0AptcbYXhcE6C7CmP6KVh7GkF0DgKnETKvXV3JXH00keQdcU35+WjeG6EmGZ
	RGwigT7LJ9eyUZZK5G+3ONsmaza622JYITW38qTasQWm5yTlhSABAj0oC2JCKZcXhtn89BwknUyy1
	wW1OS1RktI0/fauBsG+ellWieK6nvxwBHTv798zIP4tUlzptSUWP32WGQ3CMbH/k+ZljKBaQiSrDk
	UaTTTREprr9VupE+apeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMIwC-0003jd-03; Sun, 20 Oct 2019 21:40:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMIvr-0002Qn-3b; Sun, 20 Oct 2019 21:40:12 +0000
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B99422469;
 Sun, 20 Oct 2019 21:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571607610;
 bh=qgl8etf05zFSFgrmUt3a3ejlLNLZr9gR4jAYnTio8dk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q+vGSyU0uunAMGyJHqC4IiX+kVlgyKYyHxP/pjaRaZmfKnRL2VTBpkfdpUAFBxG9q
 6c97x2oAjqdPPs4ysequSxUmA3zKFsb50RTtwqCTpO4QsDH+aaRWz04KuWj2yTvPWo
 Do6FKvjIOO5BaYpnds4KsoqGAuXrTt95tibK6ig0=
Received: by mail-qt1-f182.google.com with SMTP id 3so17799160qta.1;
 Sun, 20 Oct 2019 14:40:10 -0700 (PDT)
X-Gm-Message-State: APjAAAX+Je4kvoie+EFIlLe1WtTALJ2qAKgZ3RUrjUfWhwzI3EVM3wQr
 N51YjZWZLlTQxain9mOyzoDwckZotApDk4NN/g==
X-Google-Smtp-Source: APXvYqyPNdeHc97P9vjK6aAr1OKGgzvAPW2UkIiZ4oCT73veRFA/jHuYzT+Hd/cVM4y/SwD9YgTWhEfrCQ8HEGQNi2k=
X-Received: by 2002:ac8:4508:: with SMTP id q8mr5790443qtn.110.1571607609587; 
 Sun, 20 Oct 2019 14:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-6-robh@kernel.org>
 <20191018123537.GG47056@e119886-lin.cambridge.arm.com>
In-Reply-To: <20191018123537.GG47056@e119886-lin.cambridge.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 20 Oct 2019 16:39:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLchmnwV3=Ufrs0sxc+ye5kzyKdenUa+cWxiMEzf0rFCA@mail.gmail.com>
Message-ID: <CAL_JsqLchmnwV3=Ufrs0sxc+ye5kzyKdenUa+cWxiMEzf0rFCA@mail.gmail.com>
Subject: Re: [PATCH v2 05/25] PCI: dwc: Use pci_parse_request_of_pci_ranges()
To: Andrew Murray <andrew.murray@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_144011_224471_204D6812 
X-CRM114-Status: GOOD (  16.56  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Tom Joseph <tjoseph@cadence.com>,
 Simon Horman <horms@verge.net.au>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 18, 2019 at 7:35 AM Andrew Murray <andrew.murray@arm.com> wrote:
>
> On Wed, Oct 16, 2019 at 03:06:27PM -0500, Rob Herring wrote:
> > Convert the Designware host bridge to use the common
> > pci_parse_request_of_pci_ranges().
> >
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Andrew Murray <andrew.murray@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v2:
> > - New patch
> >
> >  .../pci/controller/dwc/pcie-designware-host.c | 28 ++++++-------------
> >  1 file changed, 8 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 0f36a926059a..aeec8b65eb97 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -319,7 +319,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >       struct device *dev = pci->dev;
> >       struct device_node *np = dev->of_node;
> >       struct platform_device *pdev = to_platform_device(dev);
> > -     struct resource_entry *win, *tmp;
> > +     struct resource_entry *win;
> >       struct pci_bus *child;
> >       struct pci_host_bridge *bridge;
> >       struct resource *cfg_res;
> > @@ -342,31 +342,19 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >       if (!bridge)
> >               return -ENOMEM;
> >
> > -     ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
> > -                                     &bridge->windows, &pp->io_base);

[...]

> > +                     pp->io_bus_addr = pp->io->start - win->offset;
> > +                     pp->io_base = pci_pio_to_address(pp->io->start);
>
> Where did io_base come from? This wasn't here before, so why are we setting it
> now?

It was set in the removed devm_of_pci_get_host_bridge_resources().

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
