Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C4BC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554CD20855
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mzv8Twlh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RMlX5EIn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554CD20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oSe7pVidvZMpZPv51JokNE1cOs3TAgrMnubFTGdTYEM=; b=mzv8TwlhTE5sTwupnORA+g8Ex
	ToKLJjqO1Xn1m8gTBh98sR7IQS0JssWLEjDa4JKMhw2nKEiLcycyxP4kG1u6DdSIIX+eCZyr8W+g5
	eih7XgWiYtyB/bEuTCTV7ChbOrO/rGFr63gPXsBy6XvdhB3biw3rYolzYfk3YWeBHWkiKFOuN3cYe
	FQnYUklC3HHbEaBpJpES459pDTu0FGxWZpH0sfHpKEkVzMNnTV0f+1RIZEPff2D+tfyRcyIcuJcWu
	Uv5QTNbSUW2C0ue9pgsvQdHHu7O2WoutX9qmC1YtMSt/E/7ObeRIoIEaomR7r6T3Ir6ghE1GPBE5y
	ntmlEBz5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFqT-0001sX-Gv; Thu, 10 Sep 2020 06:14:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFqR-0001re-KW; Thu, 10 Sep 2020 06:14:08 +0000
X-UUID: bbd0d3f5f93c470eae07f7a22808a70e-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DdQYIrzP1/L5mFOIX/0qqGKPU3qmKs8BIFxJH8I2MI4=; 
 b=RMlX5EInN7tUjZy8tw0OPghGNhIASJG0fJYE78uyArprIOBg/uvoGFRJeBTjGmFt6a5a6egY+cc+EQzv2woaoioGGyeN5lO46gJQ3gUBLemSHFFM4F8gZK8MWvF7N+LrJS2dZnlf4SHUgzXZR/NRaCIJksBO0l10E8HrzuZul1s=;
X-UUID: bbd0d3f5f93c470eae07f7a22808a70e-20200909
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 297699107; Wed, 09 Sep 2020 22:14:02 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 23:14:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 14:13:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 14:13:57 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v5 2/4] PCI: mediatek: Use regmap to get shared pcie-cfg base
Date: Thu, 10 Sep 2020 14:11:13 +0800
Message-ID: <20200910061115.909-3-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200910061115.909-1-chuanjia.liu@mediatek.com>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E56F64A01EF58C90D930F3E67FC5D757695F98DABC7DEBB4E4C0F3A62154950C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_021407_796067_32BA3E2D 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use regmap to get shared pcie-cfg base and change
the method to get pcie irq.

Acked-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index cf4c18f0c25a..987845d19982 100644
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
@@ -648,7 +652,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 		return err;
 	}
 
-	port->irq = platform_get_irq(pdev, port->slot);
+	port->irq = platform_get_irq_byname(pdev, "pcie_irq");
 	if (port->irq < 0)
 		return port->irq;
 
@@ -674,12 +678,11 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	if (!mem)
 		return -EINVAL;
 
-	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
-	if (pcie->base) {
-		val = readl(pcie->base + PCIE_SYS_CFG_V2);
-		val |= PCIE_CSR_LTSSM_EN(port->slot) |
-		       PCIE_CSR_ASPM_L1_EN(port->slot);
-		writel(val, pcie->base + PCIE_SYS_CFG_V2);
+	/* MT7622/MT7629 platforms need to enable LTSSM and ASPM. */
+	if (pcie->cfg) {
+		val = PCIE_CSR_LTSSM_EN(port->slot) |
+		      PCIE_CSR_ASPM_L1_EN(port->slot);
+		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
 	}
 
 	/* Assert all reset signals */
@@ -983,6 +986,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
+	struct device_node *cfg_node;
 	int err;
 
 	/* get shared registers, which are optional */
@@ -995,6 +999,13 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 		}
 	}
 
+	cfg_node = of_parse_phandle(dev->of_node, "mediatek,pcie-cfg", 0);
+	if (cfg_node) {
+		pcie->cfg = syscon_node_to_regmap(cfg_node);
+		if (IS_ERR(pcie->cfg))
+			return PTR_ERR(pcie->cfg);
+	}
+
 	pcie->free_ck = devm_clk_get(dev, "free_ck");
 	if (IS_ERR(pcie->free_ck)) {
 		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
