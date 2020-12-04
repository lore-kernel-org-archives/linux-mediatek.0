Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4280C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 18:31:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B9022C9C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 18:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B9022C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tUDYCGxVODiPjJYkSKtpy2onDtuVtlqn1smcEvyMn7o=; b=ae50gBpXDOeggyv71lNVMLNtY
	yQn9KDR0bPKsSV4YoDnX9pm/6++WMIIJ6ooIFOiH6OlmRSw/b09kbu3CmZJK4I77jWzvRQBsF31tc
	B4wF9g+KMoHRTFpoSv3JoQ3cspF5ZPydjqoxRzxVqn8bCSR1RechI4VatCSkrLj3QQWAsa+p5rb/K
	cUsJTyHUIUhpIY+47YFeU5VQzAlKGpSt4S88xyNoOi5OLybrbAmoGoyMbgktBhjxdEwsmdYvX9nul
	5hBON3zOxteqWgwpw4IpfNiwa3U4qBuoYlF5MXYmh1d37fpVvGsPAMb2XvdZx1YLQ/czT7SI1gZf+
	en+e1XvdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klFrB-00027m-6i; Fri, 04 Dec 2020 18:31:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klFr6-00026O-7K; Fri, 04 Dec 2020 18:30:57 +0000
Date: Fri, 4 Dec 2020 12:30:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607106654;
 bh=UuBKfwwZyUYGDB525W18eDn2DMd2HDAugInym/c7VaM=;
 h=From:To:Cc:Subject:In-Reply-To:From;
 b=Twu6FxDsJ5sCFN8s0XlBosvO/6JeQbTYT9GiwnRLvHDJk+jFwg5dNGkKL/YufwpGv
 bfepItJE0XqAzgjFIg5nfo3ef0738wVtieqtdXl3XBJZWiK6OzdcWFfWEMMMZ5XEru
 QDDpTt9DZkl6OtkuSkI02r9T1yy8W0sjP+8MNqjhE9WtJ2Qiuysa5K5voDElSjrty2
 N0wzk3s19JMT3zicYFGAIKBY8Xl1r4195GNMi/VaK2bTT2RVZtf2I7s2041zdNAP0m
 +dPOtkha9DsZ1Tc9B6KBy0JMOIu942sYepSdDuWaAUeFgRnRaO9FrOqd0r+m8t2La1
 eZikW3+XEPLpw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [v4,2/3] PCI: mediatek: Add new generation controller support
Message-ID: <20201204183052.GA1929838@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204073909.GA17699@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_133056_406384_FE4644AD 
X-CRM114-Status: GOOD (  35.19  )
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
 linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>,
 sin_jieyang@mediatek.com, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 04, 2020 at 08:39:09AM +0100, Lukas Wunner wrote:
> On Mon, Nov 30, 2020 at 11:30:05AM -0600, Bjorn Helgaas wrote:
> > On Mon, Nov 23, 2020 at 02:45:13PM +0800, Jianjun Wang wrote:
> > > On Thu, 2020-11-19 at 14:28 -0600, Bjorn Helgaas wrote:
> > > > > +static int mtk_pcie_setup(struct mtk_pcie_port *port)
> > > > > +{
> [...]
> > > > > +	/* Try link up */
> > > > > +	err = mtk_pcie_startup_port(port);
> > > > > +	if (err) {
> > > > > +		dev_notice(dev, "PCIe link down\n");
> > > > > +		goto err_setup;
> > > > 
> > > > Generally it should not be a fatal error if the link is not up at
> > > > probe-time.  You may be able to hot-add a device, or the device may
> > > > have some external power control that will power it up later.
> > > 
> > > This is for the power saving requirement. If there is no device
> > > connected with the PCIe slot, the PCIe MAC and PHY should be powered
> > > off.
> > > 
> > > Is there any standard flow to support power down the hardware at
> > > probe-time if no device is connected and power it up when hot-add a
> > > device?
> > 
> > That's a good question.  I assume this looks like a standard PCIe
> > hot-add event?
> > 
> > When you hot-add a device, does the Root Port generate a Presence
> > Detect Changed interrupt?  The pciehp driver should field that
> > interrupt and turn on power to the slot via the Power Controller
> > Control bit in the Slot Control register.
> > 
> > Does your hardware require something more than that to control the MAC
> > and PHY power?
> 
> Power saving of unused PCIe ports is generally achieved through the
> runtime PM framework.  When a PCIe port runtime suspends, the PCIe
> core will transition it to D3hot.  On top of that, the platform
> may be able to transition the port to D3cold.  Currently only the
> ACPI platform supports that.  Conceivably, devicetree-based systems
> may want to disable certain clocks or regulators when a PCIe port
> runtime suspends.  I think we do not support that yet but it could
> be added to drivers/pci/pcie/portdrv*.
> 
> A hotplug port is expected to signal PDC and DLLSC interrupts even
> when in D3hot.  At least that's our experience with Thunderbolt.
> To support hotplug interrupts in D3cold, some external mechanism
> (such as a PME) is necessary to wake up the port on hotplug.
> This is also supported with recent Thunderbolt systems.
> 
> Because we've seen various incompatibilities when runtime suspending
> PCIe ports, certain conditions must be satisfied for runtime PM
> to be enabled.  They're encoded in pci_bridge_d3_possible().
> Generally, hotplug ports only runtime suspend if they belong to
> a Thunderbolt controller or if the ACPI platform explicitly allows
> runtime PM (through presence of a _PR3 method or a device property).
> Non-hotplug ports runtime suspend if the BIOS is newer than 2015
> (as specified by DMI).
> 
> Obviously, this policy is very x86-focussed because both Thunderbolt
> and DMI are only really a thing on x86.  That's about to change though
> because Apple's new arm64-based Macs have Thunderbolt integrated into
> the SoC and arm64 SoCs are making inroads in the datacenter, which is
> an important use case for PCIe hotplug (hot-swappable NVMe drives).
> So we may have to amend pci_bridge_d3_possible() to whitelist
> PCIe ports for runtime PM on specific arches or systems.

Thanks for all this very useful information!

My interpretation for the mediatek situation:

  - I assume this patch leaves or puts the Root Port in D3cold if no
    downstream devices are present.

  - I don't see any support for PME or similar mechanisms to signal a
    hot-add while the RP is in D3cold.

  - So I assume you don't support hot-add if the slot was empty at
    boot and that's acceptable for your platform.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
