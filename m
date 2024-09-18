Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AADCCD18E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yX6G8tmRW2y0i/eIzM0SIYT9xwQ3a1qekiLhuChE1Go=; b=Py2+sktZMq8vO6
	5KgX1m0xo4+vU6DXn8nnTwmxP/q3XeoctUwNsX7V6/na9WkC+ESYRnk+omIdjiAyUa8Iq3EMsj1AY
	8PYGAXcTdL90i7Z5vDx8U2kz3RfF8XhnjuOuPMRcQh0MmgY0Hbi+tifeRiaoV5hpoguHgvXhWJEH6
	GeogGRnOpjXobZu7nPaMybR/1pIfjm3p5DzDsN39dXhmZOjDefK9vFvqasqtGH/keXtGBemW9ZkVe
	ttQ+RWk5PBnv8+CKMqOHJPixIg0cRnxTISaYnYU0l9KPGP9AtUvj5qru5uKlzeixDZSCk47Gmf9Dl
	3e9H+SmPRn9xzcqcokmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpqu-00000007lkp-0o0c;
	Wed, 18 Sep 2024 08:15:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpoH-00000007l28-1KCk;
	Wed, 18 Sep 2024 08:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726647191;
	bh=a6JnRj6aYmU/JYblHyMQeQN1RmP5rC/orL4p735e1o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LafAGWjEKJ45sWlvT0r8Jey4XhyTcnrvIaDpMbofOtgCvpN4wNp78vR2Pegi8Y9Sv
	 sJuTgpb8MI7PRgNKrXbVr0nUCs2LMkIZq6aAiuRoBLYSN+F0tC6fOv2Ir3MZKqxMN3
	 gIv/DWxQXaBDjHdrwrs5OJ+iX60LhwwX71QzKPMRSYjJq6pXHiTx2dZHLHTKiT4X1v
	 LnVGKLNJykG/k8ry37nCNHmWZSOU4IYQaD8m2f/TcWp+v0PhGMk0u4KkCQOl3RQXHM
	 jwXRXd5aRL7nmFgywZ0Q3dsACwPqybY4a2TseD6kb4yFyyseDYnrlv0dchYdiSopw2
	 n6NO6p0GTpsnQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 47C9217E0FE7;
	Wed, 18 Sep 2024 10:13:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v3 1/2] PCI: mediatek-gen3: Add support for setting max-link-speed limit
Date: Wed, 18 Sep 2024 10:13:06 +0200
Message-ID: <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_011313_560815_FF464ED3 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: kw@linux.com, ryder.lee@mediatek.com, robh@kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, bhelgaas@google.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for respecting the max-link-speed devicetree property,
forcing a maximum speed (Gen) for a PCI-Express port.

Since the MediaTek PCIe Gen3 controllers also expose the maximum
supported link speed in the PCIE_BASE_CFG register, if property
max-link-speed is specified in devicetree, validate it against the
controller capabilities and proceed setting the limitations only
if the wanted Gen is lower than the maximum one that is supported
by the controller itself (otherwise it makes no sense!).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 55 ++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 66ce4b5d309b..8d4b045633da 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -28,7 +28,11 @@
 
 #include "../pci.h"
 
+#define PCIE_BASE_CFG_REG		0x14
+#define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
+
 #define PCIE_SETTING_REG		0x80
+#define PCIE_SETTING_GEN_SUPPORT	GENMASK(14, 12)
 #define PCIE_PCI_IDS_1			0x9c
 #define PCI_CLASS(class)		(class << 8)
 #define PCIE_RC_MODE			BIT(0)
@@ -125,6 +129,9 @@
 
 struct mtk_gen3_pcie;
 
+#define PCIE_CONF_LINK2_CTL_STS		0x10b0
+#define PCIE_CONF_LINK2_LCR2_LINK_SPEED	GENMASK(3, 0)
+
 /**
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
@@ -160,6 +167,7 @@ struct mtk_msi_set {
  * @phy: PHY controller block
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
+ * @max_link_speed: Maximum link speed (PCIe Gen) for this port
  * @irq: PCIe controller interrupt number
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
@@ -180,6 +188,7 @@ struct mtk_gen3_pcie {
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	u8 max_link_speed;
 
 	int irq;
 	u32 saved_irq_state;
@@ -381,11 +390,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	int err;
 	u32 val;
 
-	/* Set as RC mode */
+	/* Set as RC mode and set controller PCIe Gen speed restriction, if any */
 	val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
 	val |= PCIE_RC_MODE;
+	if (pcie->max_link_speed) {
+		val &= ~PCIE_SETTING_GEN_SUPPORT;
+
+		/* Can enable link speed support only from Gen2 onwards */
+		if (pcie->max_link_speed >= 2)
+			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT,
+					  GENMASK(pcie->max_link_speed - 2, 0));
+	}
 	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
 
+	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
+	if (pcie->max_link_speed) {
+		val = readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_STS);
+		val &= ~PCIE_CONF_LINK2_LCR2_LINK_SPEED;
+		val |= FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie->max_link_speed);
+		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
+	}
+
 	/* Set class code */
 	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
 	val &= ~GENMASK(31, 8);
@@ -1004,9 +1029,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 }
 
+static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+	int ret;
+
+	val = readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
+	val = FIELD_GET(PCIE_BASE_CFG_SPEED, val);
+	ret = fls(val);
+
+	return ret > 0 ? ret : -EINVAL;
+}
+
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 {
-	int err;
+	int err, max_speed;
 
 	err = mtk_pcie_parse_port(pcie);
 	if (err)
@@ -1031,6 +1068,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	if (err)
 		return err;
 
+	err = of_pci_get_max_link_speed(pcie->dev->of_node);
+	if (err > 0) {
+		/* Get the maximum speed supported by the controller */
+		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
+
+		/* Set max_link_speed only if the controller supports it */
+		if (max_speed >= 0 && max_speed <= err) {
+			pcie->max_link_speed = err;
+			dev_dbg(pcie->dev,
+				"Max controller link speed Gen%d, override to Gen%u",
+				max_speed, pcie->max_link_speed);
+		}
+	}
+
 	/* Try link up */
 	err = mtk_pcie_startup_port(pcie);
 	if (err)
-- 
2.46.0


