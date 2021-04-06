Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FE5C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:48:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A7C613B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A7C613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qSDzhS9KOQ05H+lNzrtjT2YMDf6YNd2KsoSFHrKAmAg=; b=huKtiUH48lnyUYTtSqgsZ4eI3
	lhtCDv+qbC/+dgDCyg4kuMu3znEYOX6ZEAXR73kwmrnMmZVNNcVYf2Xo6PkXG3HmM2CsMhvs0c/JP
	pIDigRBmd+RxL4oF9uK0DiGMOpIX08IVBA6Qpwp+VSeSGu1i2+NtxacNvk2kJfRiaDadtIskOmady
	gKs5SAaPKY+HNzGWtsip63UOVxMnWWko4lcxqoZBOVuw4pKl7Dr59rfIuzkUNX1l+sBtSo6BXso30
	iU5qtff4y4HuBEr8HxT+qGw3v9XUgvYeLNo8mHt2p45c2ZwCTZfOSblJWLMv/F3PX8Hc85G1ZLHRl
	KSWGOoSZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTch9-001NQf-EN; Tue, 06 Apr 2021 03:48:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTch4-001NOh-HQ; Tue, 06 Apr 2021 03:48:01 +0000
X-UUID: 7892e16083b742a384a1549049b320a9-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=srCyJ4hv0yOMgGecaDn8mIwgBjW7CUFHrK+csYbeGLw=; 
 b=aHi9OdEWvaSIvtelEnRaEdJaOut7WRALPRK8Lz+aQk2eIwLJqWER25hIwksMeB0p+/b0kSS7Vt1Ntk+lzYv9rVowwUL6Yh9nnXzcPhkax0k8Vff1nZekO5GkPh+gDwBEbwCXibxb9qLE+79vTRY11F3ur3V6IP5roXljfUP/dUg=;
X-UUID: 7892e16083b742a384a1549049b320a9-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1909970727; Mon, 05 Apr 2021 20:47:55 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:44:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:44:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 11:44:50 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <jianjun.wang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <yong.wu@mediatek.com>, <frank-w@public-files.de>
Subject: [PATCH v9 2/4] PCI: mediatek: Add new method to get shared pcie-cfg
 base address and parse node
Date: Tue, 6 Apr 2021 11:44:08 +0800
Message-ID: <20210406034410.24381-3-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
References: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044759_084919_B03E60D0 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For the new dts format, add a new method to get
shared pcie-cfg base address and parse node.

Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 52 +++++++++++++++++++-------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 23548b517e4b..65ebcdb8ab57 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -14,6 +14,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/msi.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -23,6 +24,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "../pci.h"
@@ -205,6 +207,7 @@ struct mtk_pcie_port {
  * struct mtk_pcie - PCIe host information
  * @dev: pointer to PCIe device
  * @base: IO mapped register base
+ * @cfg: IO mapped register map for PCIe config
  * @free_ck: free-run reference clock
  * @mem: non-prefetchable memory resource
  * @ports: pointer to PCIe port information
@@ -213,6 +216,7 @@ struct mtk_pcie_port {
 struct mtk_pcie {
 	struct device *dev;
 	void __iomem *base;
+	struct regmap *cfg;
 	struct clk *free_ck;
 
 	struct list_head ports;
@@ -648,7 +652,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 		return err;
 	}
 
-	port->irq = platform_get_irq(pdev, port->slot);
+	if (of_find_property(dev->of_node, "interrupt-names", NULL))
+		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
+	else
+		port->irq = platform_get_irq(pdev, port->slot);
+
 	if (port->irq < 0)
 		return port->irq;
 
@@ -680,6 +688,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		val |= PCIE_CSR_LTSSM_EN(port->slot) |
 		       PCIE_CSR_ASPM_L1_EN(port->slot);
 		writel(val, pcie->base + PCIE_SYS_CFG_V2);
+	} else if (pcie->cfg) {
+		val = PCIE_CSR_LTSSM_EN(port->slot) |
+		      PCIE_CSR_ASPM_L1_EN(port->slot);
+		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
 	}
 
 	/* Assert all reset signals */
@@ -983,6 +995,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
+	struct device_node *cfg_node;
 	int err;
 
 	/* get shared registers, which are optional */
@@ -995,6 +1008,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 		}
 	}
 
+	cfg_node = of_find_compatible_node(NULL, NULL,
+					   "mediatek,generic-pciecfg");
+	if (cfg_node) {
+		pcie->cfg = syscon_node_to_regmap(cfg_node);
+		if (IS_ERR(pcie->cfg))
+			return PTR_ERR(pcie->cfg);
+	}
+
 	pcie->free_ck = devm_clk_get(dev, "free_ck");
 	if (IS_ERR(pcie->free_ck)) {
 		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
@@ -1027,22 +1048,27 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct device_node *node = dev->of_node, *child;
 	struct mtk_pcie_port *port, *tmp;
-	int err;
+	int err, slot;
+
+	slot = of_get_pci_domain_nr(dev->of_node);
+	if (slot < 0) {
+		for_each_available_child_of_node(node, child) {
+			err = of_pci_get_devfn(child);
+			if (err < 0) {
+				dev_err(dev, "failed to get devfn: %d\n", err);
+				goto error_put_node;
+			}
 
-	for_each_available_child_of_node(node, child) {
-		int slot;
+			slot = PCI_SLOT(err);
 
-		err = of_pci_get_devfn(child);
-		if (err < 0) {
-			dev_err(dev, "failed to parse devfn: %d\n", err);
-			goto error_put_node;
+			err = mtk_pcie_parse_port(pcie, child, slot);
+			if (err)
+				goto error_put_node;
 		}
-
-		slot = PCI_SLOT(err);
-
-		err = mtk_pcie_parse_port(pcie, child, slot);
+	} else {
+		err = mtk_pcie_parse_port(pcie, node, slot);
 		if (err)
-			goto error_put_node;
+			return err;
 	}
 
 	err = mtk_pcie_subsys_powerup(pcie);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
