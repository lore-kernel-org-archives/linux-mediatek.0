Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E7CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 01:45:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639A9238E7
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 01:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639A9238E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0KF0C3DujO0XDAUkF/2tn6ZNdiQG3MIs/v6ozRf14MY=; b=VdJ3ozTFGGVNEKo/D7m7+jvat
	cWnYRKLxMyxgePEWUPJxCyLiHU92Sz1UCJdNlLPhnPGrh5YylPneGgFGF+wifTotvJoUYgsSrscJf
	YJmc6kM9Xuu8FWvsVPNSaFqaIDTNWndleQc1hlGeE+/4UWymIV8wk0SemtTD3RzxSXgJP8dIIqMi7
	y1IyL99UvjLoSB1ZOFlTlawHROwjpO1N/AobvPRvTUrNfEcZCUO+b17E/8RgVo4wCZDcw6Krmp763
	/1GGK39CePUQOvF9VXenTeqUr8QYvTHl7vzfrnYvCPNCbsvgKlRshH2BAOCcY+7KIldrrrvxPUogz
	kOnKglh5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmS4R-0006d1-Ub; Tue, 08 Dec 2020 01:45:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmS4O-0006cZ-5E; Tue, 08 Dec 2020 01:45:37 +0000
X-UUID: ffc47daaa41f4d3fb98edf8b62841302-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=waqy4i20W1JDrFc1FePMwNNNYqRij3lkjq7dJ8MpdPc=; 
 b=cvKWNSirrPiYVOhzij9Udf7gzWaHSbz6nbFeTdDeLWyeHgATllqzLHOHBU0sUZMYkb+Z3nr63gDUS1l62MHtGX72iz17y4tTx+M530HgQJacavyb4Du9gnI3sWW2geYA4GKBaumx1mqzLfQgF9C1wr+BxBoXQzeZccWnGLf+KVU=;
X-UUID: ffc47daaa41f4d3fb98edf8b62841302-20201207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365791845; Mon, 07 Dec 2020 17:37:04 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 17:27:39 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 09:27:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 09:27:32 +0800
Message-ID: <1607390856.14736.77.camel@mhfsdcap03>
Subject: Re: [v4,2/3] PCI: mediatek: Add new generation controller support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Tue, 8 Dec 2020 09:27:36 +0800
In-Reply-To: <20201204183052.GA1929838@bjorn-Precision-5520>
References: <20201204183052.GA1929838@bjorn-Precision-5520>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E51732604C4D2E44E18A7FAC374C6508F9E0AEBD30C5B828F9E6F2145E867B3A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_204536_422203_49E7400B 
X-CRM114-Status: GOOD (  40.58  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-pci@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 sin_jieyang@mediatek.com, Sj Huang <sj.huang@mediatek.com>,
 Lukas Wunner <lukas@wunner.de>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-12-04 at 12:30 -0600, Bjorn Helgaas wrote:
> On Fri, Dec 04, 2020 at 08:39:09AM +0100, Lukas Wunner wrote:
> > On Mon, Nov 30, 2020 at 11:30:05AM -0600, Bjorn Helgaas wrote:
> > > On Mon, Nov 23, 2020 at 02:45:13PM +0800, Jianjun Wang wrote:
> > > > On Thu, 2020-11-19 at 14:28 -0600, Bjorn Helgaas wrote:
> > > > > > +static int mtk_pcie_setup(struct mtk_pcie_port *port)
> > > > > > +{
> > [...]
> > > > > > +	/* Try link up */
> > > > > > +	err = mtk_pcie_startup_port(port);
> > > > > > +	if (err) {
> > > > > > +		dev_notice(dev, "PCIe link down\n");
> > > > > > +		goto err_setup;
> > > > > 
> > > > > Generally it should not be a fatal error if the link is not up at
> > > > > probe-time.  You may be able to hot-add a device, or the device may
> > > > > have some external power control that will power it up later.
> > > > 
> > > > This is for the power saving requirement. If there is no device
> > > > connected with the PCIe slot, the PCIe MAC and PHY should be powered
> > > > off.
> > > > 
> > > > Is there any standard flow to support power down the hardware at
> > > > probe-time if no device is connected and power it up when hot-add a
> > > > device?
> > > 
> > > That's a good question.  I assume this looks like a standard PCIe
> > > hot-add event?
> > > 
> > > When you hot-add a device, does the Root Port generate a Presence
> > > Detect Changed interrupt?  The pciehp driver should field that
> > > interrupt and turn on power to the slot via the Power Controller
> > > Control bit in the Slot Control register.
> > > 
> > > Does your hardware require something more than that to control the MAC
> > > and PHY power?
> > 
> > Power saving of unused PCIe ports is generally achieved through the
> > runtime PM framework.  When a PCIe port runtime suspends, the PCIe
> > core will transition it to D3hot.  On top of that, the platform
> > may be able to transition the port to D3cold.  Currently only the
> > ACPI platform supports that.  Conceivably, devicetree-based systems
> > may want to disable certain clocks or regulators when a PCIe port
> > runtime suspends.  I think we do not support that yet but it could
> > be added to drivers/pci/pcie/portdrv*.
> > 
> > A hotplug port is expected to signal PDC and DLLSC interrupts even
> > when in D3hot.  At least that's our experience with Thunderbolt.
> > To support hotplug interrupts in D3cold, some external mechanism
> > (such as a PME) is necessary to wake up the port on hotplug.
> > This is also supported with recent Thunderbolt systems.
> > 
> > Because we've seen various incompatibilities when runtime suspending
> > PCIe ports, certain conditions must be satisfied for runtime PM
> > to be enabled.  They're encoded in pci_bridge_d3_possible().
> > Generally, hotplug ports only runtime suspend if they belong to
> > a Thunderbolt controller or if the ACPI platform explicitly allows
> > runtime PM (through presence of a _PR3 method or a device property).
> > Non-hotplug ports runtime suspend if the BIOS is newer than 2015
> > (as specified by DMI).
> > 
> > Obviously, this policy is very x86-focussed because both Thunderbolt
> > and DMI are only really a thing on x86.  That's about to change though
> > because Apple's new arm64-based Macs have Thunderbolt integrated into
> > the SoC and arm64 SoCs are making inroads in the datacenter, which is
> > an important use case for PCIe hotplug (hot-swappable NVMe drives).
> > So we may have to amend pci_bridge_d3_possible() to whitelist
> > PCIe ports for runtime PM on specific arches or systems.
> 
> Thanks for all this very useful information!
> 
> My interpretation for the mediatek situation:
> 
>   - I assume this patch leaves or puts the Root Port in D3cold if no
>     downstream devices are present.
> 
>   - I don't see any support for PME or similar mechanisms to signal a
>     hot-add while the RP is in D3cold.
> 
>   - So I assume you don't support hot-add if the slot was empty at
>     boot and that's acceptable for your platform.

Yes, the hardware of Root Port will be totally powered off by gating its
MTCMOS and clocks if the slot is empty at boot time. Because we are
focus on the scenario of power saving, it's acceptable if we don't
support hot-add.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
