Return-Path: <SRS0=pnE3=YN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EBDCA9EAD
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2019 21:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A79221929
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2019 21:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pab/h+6J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFDrPikJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A79221929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9iDJ7VFlLwzZ9+qKadEkI5pJBPnCce/rfr9QwxQ2YI=; b=Pab/h+6J9htLMz
	zyefRd/15Hyv/OmphFdmjfEGa3+vJJbeyWFMQcjOEptSWD3DiHRRYy9kH2ddg8vHdKp9J7VhSOL0W
	K/OaaYPuvFWowzhoA3FK5yeuD4dOuAqkmifh4uye+lDOVKUwMStBdgSb1LY3088xdBpDnGli35B9U
	wI9EYtPME9dNbpwIrc2OiUz3/yUx91MJZQyfzg4/wEhFMgZrmpxZw+u6bHRId+FLg/x2ZwTryN4wP
	D7I+Q7BuddNhGO6110N1EEBvQiW2zlhIP2On4PORciIw6lDZ1NkgaIsixDaIEZUbwScd5YseatDfA
	d/KetIhmxgcKuJ6hNbow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMItB-0001oC-Qg; Sun, 20 Oct 2019 21:37:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMIsr-0000Um-Ku; Sun, 20 Oct 2019 21:37:07 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 229E521929;
 Sun, 20 Oct 2019 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571607424;
 bh=oJ9t8UtXb7PRYsq3ePfq3A9aFk1ZN+i+OvWB9IzCOps=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sFDrPikJCzwykX55SSurJgFmuuxOUHgZXuZlpY26FTjeHzgoQK+kZBQrEuQvrPZSl
 swj3ol6RnlfGAvGIDnOSky1gkb+pI38z70kPryc5Ath1MqJxokc9LifxS+bE0bORD8
 mRHyLXDF1rK1RrOrQoNT1T2ieNM+f/qGCMkH+144=
Received: by mail-qt1-f169.google.com with SMTP id o25so4352695qtr.5;
 Sun, 20 Oct 2019 14:37:04 -0700 (PDT)
X-Gm-Message-State: APjAAAUOTH5pVJtHG9/BegYPKtUTWKkFoN52HUyQU16r3N8MpzpT7nhS
 WEn0vSxXzguIG2dLNHgNA4WZh0wV85+GUu8Eeg==
X-Google-Smtp-Source: APXvYqxapHq3qkRx86TykFEOegIN1VZm+E1xyc2NVyUchfsKxelq3sgZATdHJ8Qy+cPP9gdZ1ruTPx3i/ITuPkGPW3o=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr6882617qtq.143.1571607423322; 
 Sun, 20 Oct 2019 14:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-11-robh@kernel.org>
 <20191018155152.GK47056@e119886-lin.cambridge.arm.com>
In-Reply-To: <20191018155152.GK47056@e119886-lin.cambridge.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 20 Oct 2019 16:36:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLWuUhv1qb3Soo0xKGJ167SvV3rnr+c07j9x3FFPEc3YA@mail.gmail.com>
Message-ID: <CAL_JsqLWuUhv1qb3Soo0xKGJ167SvV3rnr+c07j9x3FFPEc3YA@mail.gmail.com>
Subject: Re: [PATCH v2 10/25] PCI: rockchip: Use
 pci_parse_request_of_pci_ranges()
To: Andrew Murray <andrew.murray@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_143705_739156_32E146DF 
X-CRM114-Status: GOOD (  19.72  )
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

On Fri, Oct 18, 2019 at 10:52 AM Andrew Murray <andrew.murray@arm.com> wrote:
>
> On Wed, Oct 16, 2019 at 03:06:32PM -0500, Rob Herring wrote:
> > Convert the Rockchip host bridge to use the common
> > pci_parse_request_of_pci_ranges().
> >
> > There's no need to assign the resources to a temporary list first. Just
> > use bridge->windows directly and remove all the temporary list handling.
> >
> > Cc: Shawn Lin <shawn.lin@rock-chips.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Andrew Murray <andrew.murray@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > v2:
> > - New patch
> >
> >  drivers/pci/controller/pcie-rockchip-host.c | 36 ++++-----------------
> >  1 file changed, 7 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> > index ef8e677ce9d1..8d2e6f2e141e 100644
> > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > @@ -950,14 +950,10 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> >       struct device *dev = &pdev->dev;
> >       struct pci_bus *bus, *child;
> >       struct pci_host_bridge *bridge;
> > +     struct resource *bus_res;
> >       struct resource_entry *win;
> > -     resource_size_t io_base;
> > -     struct resource *mem;
> > -     struct resource *io;
> >       int err;
> >
> > -     LIST_HEAD(res);
> > -
> >       if (!dev->of_node)
> >               return -ENODEV;
> >
> > @@ -995,29 +991,20 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> >       if (err < 0)
> >               goto err_deinit_port;
> >
> > -     err = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
> > -                                                 &res, &io_base);
> > +     err = pci_parse_request_of_pci_ranges(dev, &bridge->windows, &bus_res);
> >       if (err)
> >               goto err_remove_irq_domain;
> >
> > -     err = devm_request_pci_bus_resources(dev, &res);
> > -     if (err)
> > -             goto err_free_res;
> > +     rockchip->root_bus_nr = bus_res->start;
> >
> >       /* Get the I/O and memory ranges from DT */
> > -     resource_list_for_each_entry(win, &res) {
> > +     resource_list_for_each_entry(win, &bridge->windows) {
> >               switch (resource_type(win->res)) {
> >               case IORESOURCE_IO:
> >                       io = win->res;
> >                       io->name = "I/O";
>
> In some patches of this series we drop the custom naming of memory resources,
> yet in others, like this one, we preserve the custom naming.

Actually, patch #11 drops it for rockchip.

> Should we be consistent in preserving the existing naming?

The custom naming seems a bit pointless IMO and something mindlessly
copied and pasted around, so I'd rather see removing the remaining
cases. The only ones left AFAICT are designware and V3.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
