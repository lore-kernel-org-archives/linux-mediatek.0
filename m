Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F299C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:30:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 157F1207F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a1hCecUc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGfZDrX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 157F1207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=41EQOTBe21wd5cXc8cjObIfsAGpPxbsKVfCQUSjXU34=; b=a1hCecUcBh52XZrEZON9126pd
	p3PHF6cbbAWUcS0uGO1UhH7Zbxp/hlNYFsNFSpzmdSBsn3OeUvMR2rEXddIZf4XtYXUs8PIl8leyg
	fY4/s6Bn9UfUB3rXm4SSH1SFYAp/0PUM4totkJll8TNncGd/cMYCixnSQJVj887+JfJt9X0eWeEsh
	paKOloflZ8p2DY9FmAlojdXvwvTkCIs3RFk2hZslDeRQMdxfR7Rrea/uN6HXbSFQ9L1T9g+QzULl9
	VW0ENvlssm5jCAbN3Yz1TpkXVLYl7m/B83c/kRT+YFC7wfmFU0+dEDqs+pWS2Dn3JYn/78GXyXeEV
	A2JbaTPQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjn07-0001uH-I9; Mon, 30 Nov 2020 17:30:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjn03-0001tO-ND; Mon, 30 Nov 2020 17:30:08 +0000
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E9332076E;
 Mon, 30 Nov 2020 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606757406;
 bh=IToxAulcLFljIt9BT9SqHMDRczdFs12OnHYPP1zKJFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jGfZDrX4SkWN1omKwJldR/43kCrQeKgACf5gruqhAT2JYzX1CpNNNLy/xqb4G3zyJ
 OkymF/y5eo0iXBkXioJND067zPFbtxHvmI/h1vaab17xze4FZ2BU2XnReIqeI3vkat
 xHw5rG76uTucS1eFYYk8eCHtbIMQhF5lj0hNpCiU=
Date: Mon, 30 Nov 2020 11:30:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v4,2/3] PCI: mediatek: Add new generation controller support
Message-ID: <20201130173005.GA1088958@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606113913.14736.37.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_123007_877846_9178EEFA 
X-CRM114-Status: GOOD (  28.23  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-pci@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
 sin_jieyang@mediatek.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[+cc Lukas, pciehp power control question]

On Mon, Nov 23, 2020 at 02:45:13PM +0800, Jianjun Wang wrote:
> On Thu, 2020-11-19 at 14:28 -0600, Bjorn Helgaas wrote:
> > "Add new generation" really contains no information.  And "mediatek"
> > is already used for the pcie-mediatek.c driver, so we should have a
> > new tag for this new driver.  Include useful information in the
> > subject, e.g.,
> > 
> >   PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192

> > > +static int mtk_pcie_setup(struct mtk_pcie_port *port)
> > > +{
> > > +	struct device *dev = port->dev;
> > > +	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct resource *regs;
> > > +	int err;
> > > +
> > > +	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
> > > +	port->base = devm_ioremap_resource(dev, regs);
> > > +	if (IS_ERR(port->base)) {
> > > +		dev_notice(dev, "failed to map register base\n");
> > > +		return PTR_ERR(port->base);
> > > +	}
> > > +
> > > +	port->reg_base = regs->start;
> > > +
> > > +	/* Don't touch the hardware registers before power up */
> > > +	err = mtk_pcie_power_up(port);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	/* Try link up */
> > > +	err = mtk_pcie_startup_port(port);
> > > +	if (err) {
> > > +		dev_notice(dev, "PCIe link down\n");
> > > +		goto err_setup;
> > 
> > Generally it should not be a fatal error if the link is not up at
> > probe-time.  You may be able to hot-add a device, or the device may
> > have some external power control that will power it up later.
> 
> This is for the power saving requirement. If there is no device
> connected with the PCIe slot, the PCIe MAC and PHY should be powered
> off.
> 
> Is there any standard flow to support power down the hardware at
> probe-time if no device is connected and power it up when hot-add a
> device?

That's a good question.  I assume this looks like a standard PCIe
hot-add event?

When you hot-add a device, does the Root Port generate a Presence
Detect Changed interrupt?  The pciehp driver should field that
interrupt and turn on power to the slot via the Power Controller
Control bit in the Slot Control register.

Does your hardware require something more than that to control the MAC
and PHY power?

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
