Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08119C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9365207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+VeH3hZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9365207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DUyAJl1FiaEFHjdenq4VpGHrhB7eLjZCXKsraL4V/Cc=; b=K+VeH3hZb6lkskM6IFUYDL4KJ
	xaoZfcbJ9SDWvMl1PXkJibdBXEMkq6Eyp5Gr9Dr9t7LOGw4DCV/MfZbSSq5QbIMA7HD0NqhDBlStd
	0wFK+EOkD9r4YEirz3W+IzLH8Rd+H+fOqtXi+2fPMh/sL0UlNG7mbvxUXPu/BG7U/M02jI1QMAQz0
	4wAcqSIX/SwVGTBSj6gkXWTkIdO7Itv4pzmHwgzBfPnP+WKFiv6OEWD9mgEb53PEI2IEAzsbZLEAd
	i3aWmxXlI92GyE8YhMa0XWssPO+604Wn1daUiy1CtOB5aOTFS1oB/BEaXjWV8d+I6XvkRGoHnNGsd
	UNvteuNwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4VG-0005Z4-D5; Wed, 22 Jul 2020 02:29:06 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SL-0003uU-FY; Wed, 22 Jul 2020 02:26:08 +0000
Received: by mail-io1-f66.google.com with SMTP id a12so833140ion.13;
 Tue, 21 Jul 2020 19:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qBR56h+8Wuois47rsNWVFZpRKn3i0WBVHHo+P3jgwk=;
 b=KMgQiASenqsZmSbBBgYwphIVCj+zdK5/po2LxU5TlKUOFO42VH+08OKm6PUfDRuUL4
 +SqZOegzjPy9AXFzACfqh8psYr0kz5XbVaM+J4P5zuVcWX0Xt+0hz+lDkNe8sJNfmBMo
 OBZVqH3btPkgagm8Qtb0G1tT7lYRxv05D99ANwRuTSuotfnLYTxBkseKOHn0esGN59zz
 vG/wwr4mHXkOsXUeH1nFDmBd4j7nz/r6gmC95s3h4kqTzUOpPD9IB0cAaTuwxYN7rcRP
 VPY9x3M8E2u2CxPaE7aQDRHe85EldW+JBTtcqImPxC1BJGLFVzNFfV9vCPPXIr88GWRG
 MGVQ==
X-Gm-Message-State: AOAM531FHugO6lrhv20YhoWPs3mXVN1EszI582DWVRsgnpaQCDJLpH3G
 3+RiMgBC8iyIM/cM47mXGA==
X-Google-Smtp-Source: ABdhPJxuCoyTSqqEClcssV5e3+sGi0LdImtFlhmZLuyxS6SY0st8kODnDNpAr5wpondw6C9g4av8kg==
X-Received: by 2002:a05:6e02:13b1:: with SMTP id
 h17mr28521625ilo.155.1595384763615; 
 Tue, 21 Jul 2020 19:26:03 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 13/19] PCI: cadence: Remove private bus number and range
 storage
Date: Tue, 21 Jul 2020 20:25:08 -0600
Message-Id: <20200722022514.1283916-14-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222605_696081_65788AAA 
X-CRM114-Status: GOOD (  21.19  )
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
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There's no need to store the bus number or range resource as the driver
only needs the bus number which is already in the pci_host_bridge.

For endpoint mode, the bus number is always 0.

Cc: Tom Joseph <tjoseph@cadence.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/cadence/pcie-cadence-ep.c  |  6 ++---
 .../controller/cadence/pcie-cadence-host.c    | 27 +++++++++----------
 drivers/pci/controller/cadence/pcie-cadence.c |  9 ++++---
 drivers/pci/controller/cadence/pcie-cadence.h |  8 +++---
 4 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 1c15c8352125..317262bdb1ee 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -156,7 +156,7 @@ static int cdns_pcie_ep_map_addr(struct pci_epc *epc, u8 fn, phys_addr_t addr,
 		return -EINVAL;
 	}
 
-	cdns_pcie_set_outbound_region(pcie, fn, r, false, addr, pci_addr, size);
+	cdns_pcie_set_outbound_region(pcie, 0, fn, r, false, addr, pci_addr, size);
 
 	set_bit(r, &ep->ob_region_map);
 	ep->ob_addr[r] = addr;
@@ -239,7 +239,7 @@ static void cdns_pcie_ep_assert_intx(struct cdns_pcie_ep *ep, u8 fn,
 	if (unlikely(ep->irq_pci_addr != CDNS_PCIE_EP_IRQ_PCI_ADDR_LEGACY ||
 		     ep->irq_pci_fn != fn)) {
 		/* First region was reserved for IRQ writes. */
-		cdns_pcie_set_outbound_region_for_normal_msg(pcie, fn, 0,
+		cdns_pcie_set_outbound_region_for_normal_msg(pcie, 0, fn, 0,
 							     ep->irq_phys_addr);
 		ep->irq_pci_addr = CDNS_PCIE_EP_IRQ_PCI_ADDR_LEGACY;
 		ep->irq_pci_fn = fn;
@@ -318,7 +318,7 @@ static int cdns_pcie_ep_send_msi_irq(struct cdns_pcie_ep *ep, u8 fn,
 	if (unlikely(ep->irq_pci_addr != (pci_addr & ~pci_addr_mask) ||
 		     ep->irq_pci_fn != fn)) {
 		/* First region was reserved for IRQ writes. */
-		cdns_pcie_set_outbound_region(pcie, fn, 0,
+		cdns_pcie_set_outbound_region(pcie, 0, fn, 0,
 					      false,
 					      ep->irq_phys_addr,
 					      pci_addr & ~pci_addr_mask,
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index f485c0405fb5..6b5d20f026de 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -20,7 +20,7 @@ static void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 	unsigned int busn = bus->number;
 	u32 addr0, desc0;
 
-	if (busn == rc->bus_range->start) {
+	if (pci_is_root_bus(bus)) {
 		/*
 		 * Only the root port (devfn == 0) is connected to this bus.
 		 * All other PCI devices are behind some bridge hence on another
@@ -50,7 +50,7 @@ static void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 	 * The bus number was already set once for all in desc1 by
 	 * cdns_pcie_host_init_address_translation().
 	 */
-	if (busn == rc->bus_range->start + 1)
+	if (busn == bridge->busnr + 1)
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_TYPE_CONF_TYPE0;
 	else
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_TYPE_CONF_TYPE1;
@@ -106,12 +106,15 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	struct cdns_pcie *pcie = &rc->pcie;
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
 	struct resource *mem_res = pcie->mem_res;
-	struct resource *bus_range = rc->bus_range;
 	struct resource *cfg_res = rc->cfg_res;
 	struct resource_entry *entry;
 	u32 addr0, addr1, desc1;
 	u64 cpu_addr;
-	int r;
+	int r, busnr = 0;
+
+	entry = resource_list_first_type(&bridge->windows, IORESOURCE_BUS);
+	if (entry)
+		busnr = entry->res->start;
 
 	/*
 	 * Reserve region 0 for PCI configure space accesses:
@@ -119,7 +122,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	 * cdns_pci_map_bus(), other region registers are set here once for all.
 	 */
 	addr1 = 0; /* Should be programmed to zero. */
-	desc1 = CDNS_PCIE_AT_OB_REGION_DESC1_BUS(bus_range->start);
+	desc1 = CDNS_PCIE_AT_OB_REGION_DESC1_BUS(busnr);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
 
@@ -136,12 +139,14 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 		u64 pci_addr = res->start - entry->offset;
 
 		if (resource_type(res) == IORESOURCE_IO)
-			cdns_pcie_set_outbound_region(pcie, 0, r, true,
+			cdns_pcie_set_outbound_region(pcie, busnr, 0, r,
+						      true,
 						      pci_pio_to_address(res->start),
 						      pci_addr,
 						      resource_size(res));
 		else
-			cdns_pcie_set_outbound_region(pcie, 0, r, false,
+			cdns_pcie_set_outbound_region(pcie, busnr, 0, r,
+						      false,
 						      res->start,
 						      pci_addr,
 						      resource_size(res));
@@ -167,18 +172,13 @@ static int cdns_pcie_host_init(struct device *dev,
 			       struct cdns_pcie_rc *rc)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
-	struct resource *bus_range = NULL;
 	int err;
 
 	/* Parse our PCI ranges and request their resources */
-	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL,
-					      &bus_range);
+	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL, NULL);
 	if (err)
 		return err;
 
-	rc->bus_range = bus_range;
-	rc->pcie.bus = bus_range->start;
-
 	err = cdns_pcie_host_init_root_port(rc);
 	if (err)
 		return err;
@@ -239,7 +239,6 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	if (ret)
 		goto err_init;
 
-	bridge->busnr = pcie->bus;
 	bridge->ops = &cdns_pcie_host_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index cd795f6fc1e2..fdd13765ee75 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -7,7 +7,7 @@
 
 #include "pcie-cadence.h"
 
-void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 				   u32 r, bool is_io,
 				   u64 cpu_addr, u64 pci_addr, size_t size)
 {
@@ -60,7 +60,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
 		/* The device and function numbers are always 0. */
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_HARDCODED_RID |
 			 CDNS_PCIE_AT_OB_REGION_DESC0_DEVFN(0);
-		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(pcie->bus);
+		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(busnr);
 	} else {
 		/*
 		 * Use captured values for bus and device numbers but still
@@ -82,7 +82,8 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR1(r), addr1);
 }
 
-void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
+						  u8 busnr, u8 fn,
 						  u32 r, u64 cpu_addr)
 {
 	u32 addr0, addr1, desc0, desc1;
@@ -94,7 +95,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie, u8 fn,
 	if (pcie->is_rc) {
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_HARDCODED_RID |
 			 CDNS_PCIE_AT_OB_REGION_DESC0_DEVFN(0);
-		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(pcie->bus);
+		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(busnr);
 	} else {
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_DEVFN(fn);
 	}
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index df14ad002fe9..02803f262f0c 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -235,7 +235,6 @@ struct cdns_pcie {
 	struct resource		*mem_res;
 	struct device		*dev;
 	bool			is_rc;
-	u8			bus;
 	int			phy_count;
 	struct phy		**phy;
 	struct device_link	**link;
@@ -248,7 +247,6 @@ struct cdns_pcie {
  * @dev: pointer to PCIe device
  * @cfg_res: start/end offsets in the physical system memory to map PCI
  *           configuration space accesses
- * @bus_range: first/last buses behind the PCIe host controller
  * @cfg_base: IO mapped window to access the PCI configuration space of a
  *            single function at a time
  * @no_bar_nbits: Number of bits to keep for inbound (PCIe -> CPU) address
@@ -259,7 +257,6 @@ struct cdns_pcie {
 struct cdns_pcie_rc {
 	struct cdns_pcie	pcie;
 	struct resource		*cfg_res;
-	struct resource		*bus_range;
 	void __iomem		*cfg_base;
 	u32			no_bar_nbits;
 	u32			vendor_id;
@@ -381,11 +378,12 @@ static inline int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 	return 0;
 }
 #endif
-void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 				   u32 r, bool is_io,
 				   u64 cpu_addr, u64 pci_addr, size_t size);
 
-void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
+						  u8 busnr, u8 fn,
 						  u32 r, u64 cpu_addr);
 
 void cdns_pcie_reset_outbound_region(struct cdns_pcie *pcie, u32 r);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
