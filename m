Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CEECD5BAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk41EPd/Ib+G6D2lYq67O+mXoP6n66SY3fZXjZ/8q2k=; b=geDYseX/Ba8NjaV125RaKHQ897
	oeSFxKhGWsUq1DcW4Egp8Fv4xse15rN02geTjEXufLBGg01gXl0suc90VFGyOEqGlokkjJQ9n03if
	Mc8NaYk6zSIX3zgrckpIPf0ZQcyPU9d/3OavWsblpHVbpwOOsB65vOKGFBG3/u3wzIy/aZQa9LkHq
	svPlKvIH/GkHR+M+GTUnqIcvY/oiYFNqeJhsIceVAV+b/nVmY+Oy3C4iEDXDdhkFtVryoTkEZHJpV
	IN8ry2zgKEV4Dt+1MK7jvCu9/65SLdn54rI0K9oyu6fkfhPkf/vMYwrOL7sTAvrVwhgrLSjuqlK2w
	KSHmyl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ74N-00000008cPE-0tDj;
	Thu, 21 May 2026 17:20:27 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ74H-00000008cMT-1psR
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 17:20:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8ED4458368;
	Thu, 21 May 2026 19:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779384017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nk41EPd/Ib+G6D2lYq67O+mXoP6n66SY3fZXjZ/8q2k=;
	b=ebSW39NphmyfTe+ihe975eQOentMYCLOjEJktdREV8HeE4uUxOesAqnYAxbFaLnNOD9Ce2
	mztTFxLOOpVAnJk3iqmHGsc5oI/G0X04OVShpIk9gOHqyDNrMzWHw6qxy9mUMkL8O8SAGm
	RK3iGugGKvShSxnVoFE8K+Uk9eEfWxxfBMK0r3hYXSAPKZPzGEgUrbmgDlIY1OtU5Q5dwx
	OvfL9I8Yc/4lHSaXneYKG2YW8LOs3DkBGY+5TLlgcbzuje1VeTJd2LQXw3kjwzIyEhzdWB
	tmYIPLownKLVR5pzaWaORMTiHzjE8WtEhvip4xYtSXXUVHLmE1EhlgZHpwUwfg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	helgaas@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v9 3/3] PCI: mediatek: Add support for EcoNet EN7528 SoC
Date: Thu, 21 May 2026 17:19:51 +0000
Message-Id: <20260521171951.1495781-4-cjd@cjdns.fr>
In-Reply-To: <20260521171951.1495781-1-cjd@cjdns.fr>
References: <20260521171951.1495781-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_102022_524208_DEA58AA8 
X-CRM114-Status: GOOD (  25.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.

These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
require re-training after startup.

Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
Before sending v9 I did some investigation to see if
pcie_failed_link_retrain() in quirks.c could be a suitable replacement
for mtk_pcie_retrain().

I discovered that it exits early on this hardware because the hardware
does not set PCI_EXP_LNKCAP_DLLLARC, and link_active_reporting is
tested.

The hardware has a register bit which claims to enable Data Link Layer
active reporting, but setting it during init does not cause
link_active_reporting to become true. Furthermore, skipping the check
in pcie_failed_link_retrain() makes the function run, but the port does
not upgrade to Gen2. Therefore I determined that it is most prudent to
keep with the mtk_pcie_retrain() logic which follows behavior of
reference code and is shown to work.
---
 drivers/pci/controller/Kconfig         |   2 +-
 drivers/pci/controller/pcie-mediatek.c | 154 +++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 2247709ef6d6..8a3a31b2bc12 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -209,7 +209,7 @@ config PCI_MVEBU
 
 config PCIE_MEDIATEK
 	tristate "MediaTek PCIe controller"
-	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_AIROHA || ARCH_MEDIATEK || ECONET || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI
 	select IRQ_MSI_LIB
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index c503fbd774d0..30f8070967b8 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -9,11 +9,13 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/errno.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/msi.h>
@@ -77,6 +79,7 @@
 
 #define PCIE_CONF_VEND_ID	0x100
 #define PCIE_CONF_DEVICE_ID	0x102
+#define PCIE_CONF_REV_CLASS	0x104
 #define PCIE_CONF_CLASS_ID	0x106
 
 #define PCIE_INT_MASK		0x420
@@ -89,6 +92,11 @@
 #define MSI_MASK		BIT(23)
 #define MTK_MSI_IRQS_NUM	32
 
+#define EN7528_HOST_MODE	0x00804201
+#define EN7528_LINKUP_REG	0x50
+#define EN7528_RC0_LINKUP	BIT(1)
+#define EN7528_RC1_LINKUP	BIT(2)
+
 #define PCIE_AHB_TRANS_BASE0_L	0x438
 #define PCIE_AHB_TRANS_BASE0_H	0x43c
 #define AHB2PCIE_SIZE(x)	((x) & GENMASK(4, 0))
@@ -148,12 +156,15 @@ struct mtk_pcie_port;
  * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
  * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
  * @MTK_PCIE_SKIP_RSTB: Skip calling RSTB bits on PCIe probe
+ * @MTK_PCIE_RETRAIN: Retrain link to bridge after startup because some
+ *                    Gen2-capable devices start as Gen1.
  */
 enum mtk_pcie_quirks {
 	MTK_PCIE_FIX_CLASS_ID = BIT(0),
 	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
 	MTK_PCIE_NO_MSI = BIT(2),
 	MTK_PCIE_SKIP_RSTB = BIT(3),
+	MTK_PCIE_RETRAIN = BIT(4),
 };
 
 /**
@@ -755,6 +766,134 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	return 0;
 }
 
+static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
+{
+	struct mtk_pcie *pcie = port->pcie;
+	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	struct resource *mem = NULL;
+	struct resource_entry *entry;
+	u32 val, link_mask;
+	int err;
+
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (entry)
+		mem = entry->res;
+	if (!mem)
+		return -EINVAL;
+
+	if (!pcie->cfg) {
+		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
+		return -EINVAL;
+	}
+
+	/* Assert all reset signals */
+	writel(0, port->base + PCIE_RST_CTRL);
+
+	/*
+	 * Enable PCIe link down reset, if link status changed from link up to
+	 * link down, this will reset MAC control registers and configuration
+	 * space.
+	 */
+	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+	msleep(PCIE_T_PVPERL_MS);
+
+	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
+	val = readl(port->base + PCIE_RST_CTRL);
+	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+	       PCIE_MAC_SRSTB | PCIE_CRSTB;
+	writel(val, port->base + PCIE_RST_CTRL);
+
+	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
+	       port->base + PCIE_CONF_REV_CLASS);
+	writel(EN7528_HOST_MODE, port->base);
+
+	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
+
+	/* 100ms timeout value should be enough for Gen1/2 training */
+	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
+				       !!(val & link_mask), 20,
+				       PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
+	if (err) {
+		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
+		return -ETIMEDOUT;
+	}
+
+	/* Activate INTx interrupts */
+	val = readl(port->base + PCIE_INT_MASK);
+	val &= ~INTX_MASK;
+	writel(val, port->base + PCIE_INT_MASK);
+
+	if (IS_ENABLED(CONFIG_PCI_MSI))
+		mtk_pcie_enable_msi(port);
+
+	/* Set AHB to PCIe translation windows */
+	val = lower_32_bits(mem->start) |
+	      AHB2PCIE_SIZE(fls(resource_size(mem)));
+	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
+
+	val = upper_32_bits(mem->start);
+	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
+
+	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
+
+	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK))
+		dev_info(pcie->dev,
+			 "module not built-in, Gen2 unavailable even if supported\n");
+
+	return 0;
+}
+
+/**
+ * mtk_pcie_retrain - retrain the root bridge link if needed
+ * @dev: The device, for use in logging
+ * @host: The host bridge which contains the link
+ *
+ * Due to what is likely a hardware bug, some devices (notably EcoNet) start up
+ * as Gen1, and must be retrained once after initial configuration in order to
+ * reach Gen2.
+ *
+ * These devices always self-identify as Gen2 capable, but sometimes the PHY is
+ * only capable of Gen1 operation, and sometimes the PCIe card (e.g. wifi) is
+ * only Gen1 capable. Therefore it is most convenient to retrain every port
+ * after startup.
+ */
+static int mtk_pcie_retrain(struct device *dev, struct pci_host_bridge *host)
+{
+	struct pci_dev *rp;
+	int ret = -ENOENT;
+	u16 lnksta = 0;
+	u32 speed;
+
+	/* Should already have been warned about during startup_port */
+	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK))
+		return 0;
+
+	guard(rwsem_read)(&pci_bus_sem);
+
+	for_each_pci_bridge(rp, host->bus) {
+		if (pci_pcie_type(rp) != PCI_EXP_TYPE_ROOT_PORT)
+			continue;
+
+#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
+		ret = pcie_retrain_link(rp, true);
+#endif
+
+		if (ret)
+			return dev_err_probe(&rp->dev, ret,
+					     "failed to retrain port\n");
+
+		pcie_capability_read_word(rp, PCI_EXP_LNKSTA, &lnksta);
+		speed = lnksta & PCI_EXP_LNKSTA_CLS;
+
+		pci_info(rp, "link retrained, speed %s\n",
+			 pci_speed_string(pcie_link_speed[speed]));
+
+	}
+
+	return 0;
+}
+
 static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
 				      unsigned int devfn, int where)
 {
@@ -1159,6 +1298,13 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	/*
+	 * Ignore error because pci_host_probe() was already called, and in any
+	 * case it is possible that the port will still work as Gen1.
+	 */
+	if (pcie->soc->quirks & MTK_PCIE_RETRAIN)
+		mtk_pcie_retrain(dev, host);
+
 	return 0;
 
 put_resources:
@@ -1274,8 +1420,16 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_en7528,
+	.setup_irq = mtk_pcie_setup_irq,
+	.quirks = MTK_PCIE_RETRAIN,
+};
+
 static const struct of_device_id mtk_pcie_ids[] = {
 	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
+	{ .compatible = "econet,en7528-pcie", .data = &mtk_pcie_soc_en7528 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.39.5


