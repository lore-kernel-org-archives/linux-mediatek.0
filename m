Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E54DC64E8A
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 16:06:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3941208C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 16:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wktco4o0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2HEFFHdT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3941208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xqXksw0/YJxQesQ5LWLWcneGh9xY9EyAFq2V8FDTKMU=; b=Wktco4o0UXtnJXT/3iX9R611N
	/sFRoKzCGb/bKepM3J0TaEemgFvlOCpkBDlg1AWACCImlgMot0gcFapGiEpb1pOiZoxHAbNvYVH5K
	EoC1Gckw2ptVpCUC/Ks8wbtZlGLHprfxN4ecg+bXisrPrTiX1+eQie4OWj/iZdFfOzAjQ1w8rI1ky
	29BDr6JtLNal2FaejKMNp57wNv2MTXruPqP9DlFUsnvCdR1C+dUxee7fQsp54yvj7iIMJ0QIwMPak
	HywOJpz7buNDBqL0vnZHQQPspw4KUdNU5QhrEzLT5/9SjxGRl+lIFtbzy7ZaWF7ZJyZa4bUhm5d/c
	eSuVMugwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjlgq-0007uy-8H; Mon, 30 Nov 2020 16:06:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjlgi-0007s6-Kp; Mon, 30 Nov 2020 16:06:05 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8AE42085B;
 Mon, 30 Nov 2020 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606752363;
 bh=1GPOYWKEqPNGZW+D562IP8XHFWfvy0me5bE6J0pU+d8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2HEFFHdTywl4CAx/p1hd7QiYvhS8NPF2Ea8lnZGgE9ImRRreBXzRmxXufDNlcLYC8
 GTq3r6CtCLehaJ7DLWvw0+E5NwB5M45pzGg+/S0+ZPz59nYqfmjftDVq7XgZ6CTrQr
 sIDgmoTV5zhOunGNY9jfhnDbbBTAN2guug6UW26g=
Received: by mail-ej1-f54.google.com with SMTP id pg6so12417131ejb.6;
 Mon, 30 Nov 2020 08:06:02 -0800 (PST)
X-Gm-Message-State: AOAM532IHyU4ttloaYxEtHKJYIlpSeLyFXYugs5Kd6pS6pdzl8QiMDfA
 sszkav0ZjTgYQDjwPJLIubENiJZ4a14U+z/g6w==
X-Google-Smtp-Source: ABdhPJxfgVyP4bnFkAOZrDfHIcdnZWjZa+nSBKw43ABRjzDjIuoZF/30uk3bcc5ez7+cDtG5GS+Y7unmH8ERNOmZGjc=
X-Received: by 2002:a17:907:2718:: with SMTP id
 w24mr15879083ejk.525.1606752361083; 
 Mon, 30 Nov 2020 08:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20201119202825.GA197305@bjorn-Precision-5520>
 <1606113913.14736.37.camel@mhfsdcap03>
In-Reply-To: <1606113913.14736.37.camel@mhfsdcap03>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Nov 2020 09:05:48 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLdqCE-sVb8T6p2E5Zf1b3pvPBtapZ8dsQGFDW3GsArjQ@mail.gmail.com>
Message-ID: <CAL_JsqLdqCE-sVb8T6p2E5Zf1b3pvPBtapZ8dsQGFDW3GsArjQ@mail.gmail.com>
Subject: Re: [v4,2/3] PCI: mediatek: Add new generation controller support
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_110604_906772_D1FFF963 
X-CRM114-Status: GOOD (  36.53  )
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
Cc: Youlin Pei <youlin.pei@mediatek.com>, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 sin_jieyang@mediatek.com, David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Nov 22, 2020 at 11:45 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> On Thu, 2020-11-19 at 14:28 -0600, Bjorn Helgaas wrote:
> > "Add new generation" really contains no information.  And "mediatek"
> > is already used for the pcie-mediatek.c driver, so we should have a
> > new tag for this new driver.  Include useful information in the
> > subject, e.g.,
> >
> >   PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
> >
> > On Wed, Nov 18, 2020 at 04:29:34PM +0800, Jianjun Wang wrote:
> > > MediaTek's PCIe host controller has three generation HWs, the new
> > > generation HW is an individual bridge, it supoorts Gen3 speed and
> > > up to 256 MSI interrupt numbers for multi-function devices.
> >
> > s/supoorts/supports/
> >
> > > Add support for new Gen3 controller which can be found on MT8192.
> > >
> > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > > Acked-by: Ryder Lee <ryder.lee@mediatek.com>

[...]

> > > +static int mtk_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
> > > +                               int where, int size, u32 *val)
> > > +{
> > > +   struct mtk_pcie_port *port = bus->sysdata;
> > > +   int bytes;
> > > +
> > > +   bytes = ((1 << size) - 1) << (where & 0x3);
> >
> > This seems like some unusual bit twiddling; at least, I don't remember
> > seeing this before.  Can you skim other drivers and see if others do
> > the same thing, and adopt a common style if they do?
>
> Hi Bjorn,
>
> Thanks for your review, I will fix it in the next version.
> >
> > > +   writel(PCIE_CFG_HEADER_FORCE_BE(devfn, bus->number, bytes),
> > > +          port->base + PCIE_CFGNUM_REG);
> > > +
> > > +   *val = readl(port->base + PCIE_CFG_OFFSET_ADDR + (where & ~0x3));
> >
> > These look like they need to be atomic, since you need a writel()
> > followed by a readl().
> >
> > pci_lock_config() (used in pci_bus_read_config_*(), etc) uses the
> > global pci_lock for this unless CONFIG_PCI_LOCKLESS_CONFIG is set.
> >
> > But I would like to eventually move away from this implicit dependency
> > on pci_lock.  If you need to make this atomic, can you add the
> > explicit locking here, so there's a clear connection between the lock
> > and the things it protects?
>
> Sure, I will split it to a map_bus() function and use the standard
> pci_generic_config_read32/write32 functions as Rob's suggestion. I think
> the potential risks of atomic read/write can be avoided.

The generic functions have no effect on atomicity, but using them does
make it easier to find the non-atomic cases.

I'm not sure that having host drivers do their own locking is the best
approach. That's a recipe for more cleanups. It's a common enough
issue that I think it's better if we have locking done in 1 place.
Then host drivers can simply say if they need locking or not via some
bus flag.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
