Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9E1C55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 08:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693A22071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 08:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYyLKPH7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aUCcaipU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693A22071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vwIXaiWpnUgLQqHubPAfbzR2vuXLbKc0mVlVEbJc9eo=; b=GYyLKPH7K5KMAfPqzd79h5uDo
	K4B7ti/FBbkkGfFRXzIuiKHqnp1z/VFe9yHmbvQPmiXlXQHVj5GykGGMQJc6egfnuuPptCPs8N6/R
	B7zHyphRYHRSK/kzeEuqgbzGbS1M4Mp32aEGcSkGA9aFuO1zGvaVg6/tIxXM/wdySuotMPusDGYwn
	yrukpm43t+qeo0ZLB3Fof5UJUChSR+EG+/QkHGLl1kG4ngBWp6ozQBRjrPp4ihpJwVhK7+rdb+QPK
	Q1hm8YmIO6iyq6Dsag4s0iXMkMUitSUB3V2Zi35h7J7vQadv/oFqlZ+NrWbxW2V9AIh1tg5KDw/do
	i/VXvP99w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY360-0006L1-Fl; Thu, 29 Oct 2020 08:15:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY35y-0006Jk-D1; Thu, 29 Oct 2020 08:15:43 +0000
X-UUID: aee984493b314dd0a5b424ef6768c1d7-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XMZxyn6b3FBsdxBCB2TKGC6CA3eMv9x5H8CXbCfu32I=; 
 b=aUCcaipUCnCQ8QjYW4R0m2HFAcoCI+SiIllLj8fB6Ig2/r0jAlmPCpRzo8qmFRs725w+rh9YFJx1SYbH3toolvFhSK4ibAPm3SrVsMyQZ+J/KDTMfhH6Qhhncz2jc+hwJnJnomQIjt8N86chNtom/hywpARbAHZGP5yaj+FUTPQ=;
X-UUID: aee984493b314dd0a5b424ef6768c1d7-20201029
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 826783129; Thu, 29 Oct 2020 00:15:37 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 01:15:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 16:15:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 16:15:31 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: [PATCH v7 2/4] PCI: mediatek: Add new method to get shared pcie-cfg
 base and irq
Date: Thu, 29 Oct 2020 16:15:11 +0800
Message-ID: <20201029081513.10562-3-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
References: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9C279CAB933F5525C2B98DF3722B1F281CCCD40D526927B3E7820706685DC4622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_041542_631778_7AC1F1DD 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Frank
 Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 chuanjia.liu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new method to get shared pcie-cfg base and pcie irq for
new dts format.

Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index cf4c18f0c25a..5b915eb0cf1e 100644
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
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
