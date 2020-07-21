Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27801C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 07:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF744208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 07:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEeRF4Zz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qYq8GHJP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF744208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hl1M6Mt/yMvO5jcDLO1z6zoeJFIE3+bU099zK051iaY=; b=WEeRF4ZzXmNfIemwz4266d2wV
	JZSKH0naUvgUgxFFD7f/VVx/twOEM5ecyRMbo9w2alWA78tux+ptNhclrHMeFkh+8coYFTVqARC2W
	Thi8EwKCClcsS3d9t1qFLp6kGcZf5ud7RI8CrOtXLl2gZJCgS1mYBrpt/t1loysjbwKJT6jbfOwa2
	mbFzscKOYDdmPbGM9j/3foicER7yYjfC+mJrl6S3Pga5/B7arTNPpd4j6zK9IVkkoiH0tR70dhIVF
	sjDQhvS8K2UtzosesM20zjwmzqmyfNFJv+R6cXhhzMdroRZegi9QzQDFLbkbWCauYPZs6jqwsJFzw
	HDfa+cbHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxn3W-0003nY-4s; Tue, 21 Jul 2020 07:51:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxn3T-0003lA-6K; Tue, 21 Jul 2020 07:51:16 +0000
X-UUID: bbd27d6df67e4f15bb2e5beadf72561d-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lf/89Iy3pAUr+fnJQL7OFHOwuPDtLnW3HnB4JZlmPk0=; 
 b=qYq8GHJPC5Y7lcpuoIgnxAFPcOqSyMjViZxSXjaUaZj55T6SYXa8xal40T5f/fYOWhLX7OGqgYgiJ06UEP1b+J1dWqC41+NVJiLMcocMoEnMG2f7Y+h5CaHpkDkyRkQWuiemrY75gLfQhjqoZ95ZZNTze5fp2Stjg9RhNlozVlY=;
X-UUID: bbd27d6df67e4f15bb2e5beadf72561d-20200720
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 738746855; Mon, 20 Jul 2020 23:51:06 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 00:51:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 15:51:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 15:51:04 +0800
From: chuanjia.liu <Chuanjia.Liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 2/4] PCI: mediatek: Use regmap to get shared pcie-cfg base
Date: Tue, 21 Jul 2020 15:49:13 +0800
Message-ID: <20200721074915.14516-3-Chuanjia.Liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
References: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6BEC5FA2414E024BB522A8603F726C3CBEFF5822726D4DA9B05BACD628361AD52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_035115_418866_4A327C4E 
X-CRM114-Status: GOOD (  14.19  )
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
 "chuanjia.liu" <Chuanjia.Liu@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use regmap to get shared pcie-cfg base and change
the method to get pcie irq.

Acked-by:Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: chuanjia.liu <Chuanjia.Liu@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index ebfa7d5a4e2d..659ff9a685b0 100644
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
@@ -214,6 +217,7 @@ struct mtk_pcie_port {
 struct mtk_pcie {
 	struct device *dev;
 	void __iomem *base;
+	struct regmap *cfg;
 	struct clk *free_ck;
 
 	struct list_head ports;
@@ -650,7 +654,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 		return err;
 	}
 
-	port->irq = platform_get_irq(pdev, port->slot);
+	port->irq = platform_get_irq_byname(pdev, "pcie_irq");
 	if (port->irq < 0)
 		return port->irq;
 
@@ -676,12 +680,11 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
@@ -987,6 +990,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
+	struct device_node *cfg_node;
 	int err;
 
 	/* get shared registers, which are optional */
@@ -999,6 +1003,13 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
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
