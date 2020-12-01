Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31238C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 03:28:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 901B520705
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 03:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UEby/V3y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fb2t/M/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 901B520705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=57lkvzIKU6QejRoSuuhYCRMvxijqQZV1h4VMrfuRTNM=; b=UEby/V3ydHb1fue+Oshu7mjEj
	OLfTjFwuQQRFi3GmA3txZbbFeDk5liEyKJABaVvGML+ClnOq2t1ZJU4SMmaMvss0PkPHBmlWB1u3o
	onrf3pAi4EjmPqIJUvyaGmEBXy9wxfaexI/JVdOSUMfm3HehoaLycWW2eo8Qt3NsAT1arZstiO29W
	5uuY7VNW8UsMsPqK0/4LdYvW1/3kI1qbScFFmJrCacBrKJm8las+a0hC5cdwZk89w7DEoGgsBgG0v
	DNUEDmPMgzsr1B2yzWE2t01HYKJ5bcw2pK1Sc1bBoiyLPd83WQ82Rn85BN5LfyTQ0WDoPajvjAqTz
	s8igZMS2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjwL2-0004o7-3b; Tue, 01 Dec 2020 03:28:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjwKz-0004nc-Ix; Tue, 01 Dec 2020 03:28:22 +0000
X-UUID: 0e42aab36fcb4a89ac273a4fc1b72ba5-20201130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2aXVN+zVHNxxltuwnwGBJajzVvMc3w46iOtEkP3tAkc=; 
 b=fb2t/M/VJUhauyRALv1pYceOCzyqIjsT/M++V0qELJcw/YxNKaIiTtbLhF99+GVIxxC0aCov9WcEm4RVRu17Dtilvc8kdAjQhY/izNJNEsfVh9ILb6XuuZCAeSZRaKewo+FG130KcNfyeRwAwfSzRyw9ggF8LWjnO7+xk0TXRG4=;
X-UUID: 0e42aab36fcb4a89ac273a4fc1b72ba5-20201130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1877702219; Mon, 30 Nov 2020 19:16:35 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 19:06:46 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Dec 2020 11:06:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Dec 2020 11:06:43 +0800
Message-ID: <1606792003.14736.63.camel@mhfsdcap03>
Subject: Re: [v4,2/3] PCI: mediatek: Add new generation controller support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Tue, 1 Dec 2020 11:06:43 +0800
In-Reply-To: <20201130173005.GA1088958@bjorn-Precision-5520>
References: <20201130173005.GA1088958@bjorn-Precision-5520>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC451FC4603DE65A509FD6378268318300EC02B2017977A484F41EC915355B5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_222821_827366_A41AE486 
X-CRM114-Status: GOOD (  32.59  )
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
 linux-kernel@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lukas Wunner <lukas@wunner.de>, sin_jieyang@mediatek.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-30 at 11:30 -0600, Bjorn Helgaas wrote:
> [+cc Lukas, pciehp power control question]
> 
> On Mon, Nov 23, 2020 at 02:45:13PM +0800, Jianjun Wang wrote:
> > On Thu, 2020-11-19 at 14:28 -0600, Bjorn Helgaas wrote:
> > > "Add new generation" really contains no information.  And "mediatek"
> > > is already used for the pcie-mediatek.c driver, so we should have a
> > > new tag for this new driver.  Include useful information in the
> > > subject, e.g.,
> > > 
> > >   PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
> 
> > > > +static int mtk_pcie_setup(struct mtk_pcie_port *port)
> > > > +{
> > > > +	struct device *dev = port->dev;
> > > > +	struct platform_device *pdev = to_platform_device(dev);
> > > > +	struct resource *regs;
> > > > +	int err;
> > > > +
> > > > +	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
> > > > +	port->base = devm_ioremap_resource(dev, regs);
> > > > +	if (IS_ERR(port->base)) {
> > > > +		dev_notice(dev, "failed to map register base\n");
> > > > +		return PTR_ERR(port->base);
> > > > +	}
> > > > +
> > > > +	port->reg_base = regs->start;
> > > > +
> > > > +	/* Don't touch the hardware registers before power up */
> > > > +	err = mtk_pcie_power_up(port);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	/* Try link up */
> > > > +	err = mtk_pcie_startup_port(port);
> > > > +	if (err) {
> > > > +		dev_notice(dev, "PCIe link down\n");
> > > > +		goto err_setup;
> > > 
> > > Generally it should not be a fatal error if the link is not up at
> > > probe-time.  You may be able to hot-add a device, or the device may
> > > have some external power control that will power it up later.
> > 
> > This is for the power saving requirement. If there is no device
> > connected with the PCIe slot, the PCIe MAC and PHY should be powered
> > off.
> > 
> > Is there any standard flow to support power down the hardware at
> > probe-time if no device is connected and power it up when hot-add a
> > device?
> 
> That's a good question.  I assume this looks like a standard PCIe
> hot-add event?
> 
> When you hot-add a device, does the Root Port generate a Presence
> Detect Changed interrupt?  The pciehp driver should field that
> interrupt and turn on power to the slot via the Power Controller
> Control bit in the Slot Control register.
> 
> Does your hardware require something more than that to control the MAC
> and PHY power?
> 
> Bjorn

The hardware support to generate a Presence Detect Changed interrupt
when hot-add a device.

But it seems that we should keep the PHY's power and clocks to ensure
the data link layer state change can be detected, and keep the MAC layer
active for routing the interrupt event to pciehp driver handler.

For the power saving requirement, the modules that is not used when
probe-time must be powered off, so I think we may not support hot-plug
in this case.

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
