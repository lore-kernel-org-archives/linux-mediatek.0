Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD80C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 04:46:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9466199F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 04:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9466199F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7LRZyYTlNHPM3fDsdhEU7+ZX+JMSXkMgdz0sAWJwRok=; b=qdK+boY4/9uQ/szsRCnLF+DiS
	hiAae05jJlmELrzvI8gEU6cb40JD0/uSUIUjRxDBUHHR/JoMbRbyT9oV9SeRSL2QKohQ1MTSknYb6
	1VTqJBwXaM6NhG0VnJ24zAK1tvZdMae6Sfr8Cw3NplBulSlvf55FdBiTyT6guiu/bbdzQN6FGXmaK
	T98b7GVc5UZTeDpmvnodwbO/0ig5uDdEbgdIrJrReyQWMeXd50RmYmCYm8TMGpxNlfaYTg5Djstuj
	VzU1SaXH63cmv+p2g1LA5FX8vKzxLG4y88dD81g6ZyKakyrpgV4zwyv1+gf9sqEIPjyPkETBKfKWn
	TxdZ96Alg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOYwD-00DlX0-IL; Tue, 23 Mar 2021 04:46:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOXtc-00DcUQ-RM; Tue, 23 Mar 2021 03:40:01 +0000
X-UUID: edfc30e69a044ca6bf4f05462fa9ceda-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5VGGhTYnqiKJlsMmUNBZC1ehw/BOiqHQNTSZyTu2hrQ=; 
 b=UEw01BoTdNE3GYMWhEucEzYSDBB7TKfMEX9NzldA5qFGiH2GdjsOU57hmdJWH1K3PIy6rXmPxovSqEjupkJqnVdp7yESybC1BEnKKeOxvMn8cOTaYcMCdECMZNLGU0IEUzMkpPRVpSkTIuC/mKSMyVwCiR+1/wbskF8oU41ZXBE=;
X-UUID: edfc30e69a044ca6bf4f05462fa9ceda-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 590208366; Mon, 22 Mar 2021 19:39:46 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 20:39:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 11:39:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 11:39:35 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <jianjun.wang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <yong.wu@mediatek.com>, <frank-w@public-files.de>
Subject: [PATCH v8 2/4] PCI: mediatek: Add new method to get shared pcie-cfg
 base address and parse node
Date: Tue, 23 Mar 2021 11:38:31 +0800
Message-ID: <20210323033833.14954-3-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210323033833.14954-1-chuanjia.liu@mediatek.com>
References: <20210323033833.14954-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2E36C7F3901E0ECAF56480B004CEDB4ED3374B43F66849B606AAFD2AC10FA9D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_033958_184096_C4D6CC1E 
X-CRM114-Status: GOOD (  18.41  )
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
 drivers/pci/controller/pcie-mediatek.c | 50 +++++++++++++++++++-------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 23548b517e4b..c40d933d2c06 100644
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
@@ -1027,20 +1048,25 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
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
 			goto error_put_node;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
