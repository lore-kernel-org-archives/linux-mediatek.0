Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2729BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 11:41:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE74206B5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 11:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XvHSvAOG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOUAsDZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE74206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3eDAyiDjOVlQggcGOeUXxaefJsrCB3W1201egbi2vKE=; b=XvHSvAOGbkHa6JY3R0Ub5IA7j
	2KFv6sh0R3HtXFGwL+lSTpCzXWvUPSdbG1b710Dflr1byPr0Qr7TaVv/AiPtQh7LUH/iaJC5yQ4ni
	CZdHXQpZMrQ1HsB5HhsA03KaIxoR2/E4cGtcHTzd+lWehUjDnV/X9nxgcT6gwmWsRSpqTMgKpg1tW
	YdIl54ihraqC82Fg3YfLqmFBGtDYP4vhdfrWMpGBYNtWX8RxaNM44ygfcPpkGCnrBNp+j5zmVDCxF
	rfCfJMloC56Wn2R1k9Z3zsRyFJOpn96COUdCQ1Zzg7omWHxjLdRQfOiQ4nVdowe5Jku+m08tC4uUM
	IViZIOVHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZugp-0002wC-Nw; Tue, 03 Nov 2020 11:41:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZugm-0002va-HG
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 11:41:25 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68A7D206B5;
 Tue,  3 Nov 2020 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604403683;
 bh=uWJT7Ml+UyvnL/NnaTwU6dru3EcKTJDjPAymbTqARt0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fOUAsDZIQrYWY3ZJkSU+lyevxxrz6WH8w6rQuMwGy4W13DTB0O0B3mQwn3dbpAykW
 qHEi9Q6q9LBk8OHO4Ir+HSA+eaMnDpMD6xlBFUFPjlaha1qLldA1Vikl2qSEm9WXfL
 DXercj+2yuzfUo22H4cRBGq+KDXZqaMtMiRUMuFs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kZugj-0077zU-64; Tue, 03 Nov 2020 11:41:21 +0000
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 11:41:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <87k0v27mve.fsf@nanos.tec.linutronix.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
 <87h7q791j8.fsf@nanos.tec.linutronix.de>
 <877dr38kt8.fsf@nanos.tec.linutronix.de>
 <901c5eb8bbaa3fe53ddc8f65917e48ef@kernel.org>
 <87k0v27mve.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <41e2e3ea115aa8cbbb9a5c313dca0210@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tglx@linutronix.de, frank-w@public-files.de,
 ryder.lee@mediatek.com, linux-mediatek@lists.infradead.org, linux@fw-web.de,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, bhelgaas@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_064124_757034_572E8666 
X-CRM114-Status: GOOD (  24.61  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-03 10:31, Thomas Gleixner wrote:
> On Tue, Nov 03 2020 at 09:54, Marc Zyngier wrote:
>> On 2020-11-02 22:18, Thomas Gleixner wrote:
>>> So we really need some other solution and removing the warning is not
>>> an option. If MSI is enabled then we want to get a warning when a PCI
>>> device has no MSI domain associated. Explicitly expressing the PCIE
>>> brigde misfeature of not supporting MSI is way better than silently
>>> returning an error code which is swallowed anyway.
>> 
>> I don't disagree here, though the PCI_MSI_ARCH_FALLBACKS mechanism
>> makes it more difficult to establish.
> 
> Only for the few leftovers which implement msi_controller, i.e.
> 
> drivers/pci/controller/pci-hyperv.c
> drivers/pci/controller/pci-tegra.c
> drivers/pci/controller/pcie-rcar-host.c
> drivers/pci/controller/pcie-xilinx.c
> 
> The architectures which select PCI_MSI_ARCH_FALLBACKS are:
> 
> arch/ia64/Kconfig:      select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
> arch/mips/Kconfig:      select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
> arch/powerpc/Kconfig:   select PCI_MSI_ARCH_FALLBACKS           if 
> PCI_MSI
> arch/s390/Kconfig:      select PCI_MSI_ARCH_FALLBACKS   if PCI_MSI
> arch/sparc/Kconfig:     select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
> 
> implement arch_setup_msi_irq() which makes it magically work :)
> 
>>> Whatever the preferred way is via flags at host probe time or 
>>> flagging
>>> it post probe I don't care much as long as it is consistent.
>> 
>> Host probe time is going to require some changes in the core PCI api,
>> as everything that checks for a MSI domain is based on the pci_bus
>> structure, which is only allocated much later.
> 
> Yeah, it's nasty. One possible solution is to add flags or a callback 
> to
> pci_ops, but it's not pretty either.
> 
> I think we should go with the 'mark it after pci_host_probe()' hack for
> 5.10-rc. The real fix will be larger and go into 5.11.
> 
> Thoughts?

We can do that, although I worried that it isn't 100% reliable:

pci_host_probe() ends up calling pci_add_device(), and will start
probing devices if the endpoint drivers have already registered
with the core code, long before the flag gets set.

Here's what I've hacked together for a guest that doesn't have
any MSI capability:

diff --git a/drivers/pci/controller/pci-host-common.c 
b/drivers/pci/controller/pci-host-common.c
index 6ce34a1deecb..7dd5145cd38d 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -55,6 +55,7 @@ int pci_host_common_probe(struct platform_device 
*pdev)
  	struct pci_host_bridge *bridge;
  	struct pci_config_window *cfg;
  	const struct pci_ecam_ops *ops;
+	int ret;

  	ops = of_device_get_match_data(&pdev->dev);
  	if (!ops)
@@ -80,7 +81,10 @@ int pci_host_common_probe(struct platform_device 
*pdev)

  	platform_set_drvdata(pdev, bridge);

-	return pci_host_probe(bridge);
+	ret = pci_host_probe(bridge);
+	bridge->bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
+
+	return ret;
  }
  EXPORT_SYMBOL_GPL(pci_host_common_probe);

(plus another hack to get the host controller to initialise a bit
later, though building it as a module will achieve the same thing):

[    0.369114] 9pnet: Installing 9P2000 support
[    0.369807] mpls_gso: MPLS GSO support
[    0.370512] registered taskstats version 1
[    0.371204] Loading compiled-in X.509 certificates
[    0.371988] zswap: loaded using pool lzo/zbud
[    0.373041] pci-host-generic 40000000.pci: host bridge /pci ranges:
[    0.374045] pci-host-generic 40000000.pci:       IO 
0x0000000000..0x000000ffff -> 0x0000000000
[    0.375458] pci-host-generic 40000000.pci:      MEM 
0x0041000000..0x007fffffff -> 0x0041000000
[    0.376848] pci-host-generic 40000000.pci: ECAM at [mem 
0x40000000-0x40ffffff] for [bus 00]
[    0.378204] pci-host-generic 40000000.pci: PCI host bridge to bus 
0000:00
[    0.379316] pci_bus 0000:00: root bus resource [bus 00]
[    0.380146] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.381131] pci_bus 0000:00: root bus resource [mem 
0x41000000-0x7fffffff]
[    0.382267] pci 0000:00:00.0: [1af4:1009] type 00 class 0xff0000
[    0.383369] pci 0000:00:00.0: reg 0x10: [io  0x6200-0x62ff]
[    0.384286] pci 0000:00:00.0: reg 0x14: [mem 0x41000000-0x410000ff]
[    0.385324] pci 0000:00:00.0: reg 0x18: [mem 0x41000200-0x410003ff]
[    0.386680] pci 0000:00:01.0: [1af4:1009] type 00 class 0xff0000
[    0.387778] pci 0000:00:01.0: reg 0x10: [io  0x6300-0x63ff]
[    0.388696] pci 0000:00:01.0: reg 0x14: [mem 0x41000400-0x410004ff]
[    0.389730] pci 0000:00:01.0: reg 0x18: [mem 0x41000600-0x410007ff]
[    0.391070] pci 0000:00:02.0: [1af4:1000] type 00 class 0x020000
[    0.392212] pci 0000:00:02.0: reg 0x10: [io  0x6400-0x64ff]
[    0.393137] pci 0000:00:02.0: reg 0x14: [mem 0x41000800-0x410008ff]
[    0.394163] pci 0000:00:02.0: reg 0x18: [mem 0x41000a00-0x41000bff]
[    0.395678] pci 0000:00:00.0: BAR 2: assigned [mem 
0x41000000-0x410001ff]
[    0.396762] pci 0000:00:01.0: BAR 2: assigned [mem 
0x41000200-0x410003ff]
[    0.397851] pci 0000:00:02.0: BAR 2: assigned [mem 
0x41000400-0x410005ff]
[    0.398934] pci 0000:00:00.0: BAR 0: assigned [io  0x1000-0x10ff]
[    0.400014] pci 0000:00:00.0: BAR 1: assigned [mem 
0x41000600-0x410006ff]
[    0.401105] pci 0000:00:01.0: BAR 0: assigned [io  0x1100-0x11ff]
[    0.402080] pci 0000:00:01.0: BAR 1: assigned [mem 
0x41000700-0x410007ff]
[    0.403185] pci 0000:00:02.0: BAR 0: assigned [io  0x1200-0x12ff]
[    0.404156] pci 0000:00:02.0: BAR 1: assigned [mem 
0x41000800-0x410008ff]
[    0.405344] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy 
driver
[    0.406569] ------------[ cut here ]------------
[    0.407347] WARNING: CPU: 1 PID: 1 at include/linux/msi.h:213 
__pci_enable_msix_range+0x680/0x720
[    0.408884] Modules linked in:
[    0.409429] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
5.10.0-rc2-dirty #2117
[    0.410646] Hardware name: linux,dummy-virt (DT)
[    0.411463] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[    0.412505] pc : __pci_enable_msix_range+0x680/0x720
[    0.413380] lr : __pci_enable_msix_range+0x394/0x720
[    0.414244] sp : ffffffc0119ab3d0
[    0.414830] x29: ffffffc0119ab3d0 x28: 0000000000000002
[    0.415766] x27: ffffff804107b0b8 x26: ffffff804107b000
[    0.416689] x25: ffffff80410acb00 x24: 0000000000000000
[    0.417623] x23: ffffff80410ac480 x22: ffffff804107b000
[    0.418549] x21: ffffff804107b2e8 x20: 0000000000000014
[    0.419482] x19: 0000000000000002 x18: 00000000fffffffc
[    0.420408] x17: 000000002ce4d3e3 x16: 00000000a4f09d66
[    0.421342] x15: 0000000000000020 x14: ffffffffffffffff
[    0.422268] x13: 0000000041001000 x12: ffffffc0119cf000
[    0.423201] x11: ffffffc010000000 x10: ffffffc0119cd000
[    0.424127] x9 : ffffffc010628ad4 x8 : 0000000000000000
[    0.425063] x7 : 0000000000000000 x6 : 000000000000003f
[    0.425989] x5 : 0000000000000040 x4 : ffffff804107b2e8
[    0.426914] x3 : 0000000000000004 x2 : 0000000000000000
[    0.427855] x1 : 0000000000000000 x0 : 0000000000000000
[    0.428788] Call trace:
[    0.429226]  __pci_enable_msix_range+0x680/0x720
[    0.430033]  pci_alloc_irq_vectors_affinity+0xcc/0x144
[    0.430932]  vp_find_vqs_msix+0xdc/0x414
[    0.431631]  vp_find_vqs+0x54/0x1c0
[    0.432245]  p9_virtio_probe+0xa8/0x374

This is admittedly a contrived example, but I'm not convinced it is
completely unlikely.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
