Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05285C35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRmbq8ky6Rk0k+k9PALa2kPNaZiR9ktue+7R8+Hd1fg=; b=X8522//ErCCghYBKN9VZv5GPVP
	Iz8z6IdDmzWnhqQwPCDsrp7OnrJaSB68I4hyWgM+BkHPDjqRsFvW//6qrGd3WNs9whqbADHTSooxf
	qgTpMLR0U2rOjdS06fqW4lMx3Hwuq6dmnM4UlJOhdD8YNDpvbSYFagJ4F1JTN4xmQ9EqrX4cENeVX
	iaVt4pfcNAHqT3TinR6ulb5WjbpygN7TQArrZSzEyQdmdzkAdJiP6ivbn2oCymaxomSx1opYuJTWJ
	7peSxAREV1SkketzsYj2aqlWIH3KAOs+n4+kZC5VS6kFYsSFLHZIjZnmx5gOc0VshW9WaseuxTAdt
	4ZenPoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUIU-00000005nYD-2btn;
	Tue, 17 Sep 2024 09:14:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUFG-00000005myu-4B3y;
	Tue, 17 Sep 2024 09:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726564297;
	bh=CmBOrOWMOO93CuLcWjDRjEaUDrbCyW9xdULFfDPOC8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mUjkdxI92OKogmFv2ioV4lARuuwB/8U1GJ6Odx4FuHWDrfD2G401S6ZXXHrN9I4f+
	 Ajeu+j8suXW0DGcWDPxKJKksXOT7m3pb+PPebwGjwprHd65/UpHmqLFccxApj9DmJN
	 yWUbTjpgbZ2n8e9JIeUk6aVuCcJel9ARttKnrJmo40Pz53b6ZTqImR2oEGvvOqMIYY
	 Ilr8VYo/BmSo9jiAMDnQrd/5vbD8arWg+kWfkprdIVNDn/8cT7fOWtEADW4UuKoW1q
	 kXs4FMXvhpY1BqLKW5o5mjzOvwt+yBwruLAxKip/ahD3K8v1aF0fKH1tvtZruS09sE
	 lLKMuMuN5N56g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB01F17E1097;
	Tue, 17 Sep 2024 11:11:36 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/2] PCI: mediatek-gen3: Add support for restricting link width
Date: Tue, 17 Sep 2024 11:11:32 +0200
Message-ID: <20240917091132.286582-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240917091132.286582-1-angelogioacchino.delregno@collabora.com>
References: <20240917091132.286582-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_021139_229518_4D163A99 
X-CRM114-Status: GOOD (  16.68  )
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

Add support for restricting the port's link width by specifying
the num-lanes devicetree property in the PCIe node.

The setting is done in the GEN_SETTINGS register (in the driver
named as PCIE_SETTING_REG), where each set bit in [11:8] activates
a set of lanes (from bits 11 to 8 respectively, x16/x8/x4/x2).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 22 ++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index e1d1fb39d5c6..e2c9802a230c 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -32,6 +32,7 @@
 #define PCIE_BASE_CFG_SPEED_MASK	GENMASK(15, 8)
 
 #define PCIE_SETTING_REG		0x80
+#define PCIE_SETTING_LINK_WIDTH		GENMASK(11, 8)
 #define PCIE_SETTING_GEN_SUPPORT_MASK	GENMASK(14, 12)
 #define PCIE_PCI_IDS_1			0x9c
 #define PCI_CLASS(class)		(class << 8)
@@ -168,6 +169,7 @@ struct mtk_msi_set {
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
  * @max_link_speed: Maximum link speed (PCIe Gen) for this port
+ * @num_lanes: Number of PCIe lanes for this port
  * @irq: PCIe controller interrupt number
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
@@ -189,6 +191,7 @@ struct mtk_gen3_pcie {
 	struct clk_bulk_data *clks;
 	int num_clks;
 	u8 max_link_speed;
+	u8 num_lanes;
 
 	int irq;
 	u32 saved_irq_state;
@@ -390,7 +393,7 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	int err;
 	u32 val;
 
-	/* Set as RC mode and set controller PCIe Gen speed restriction, if any*/
+	/* Set as RC mode and set controller PCIe Gen speed/lanes restriction, if any */
 	val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
 	val |= PCIE_RC_MODE;
 	if (pcie->max_link_speed) {
@@ -401,6 +404,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT_MASK,
 					  GENMASK(pcie->max_link_speed - 2, 0));
 	}
+	if (pcie->num_lanes) {
+		val &= ~PCIE_SETTING_LINK_WIDTH;
+
+		/* Zero means one lane, each bit activates x2/x4/x8/x16 */
+		if (pcie->num_lanes > 1)
+			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
+					  GENMASK(pcie->num_lanes >> 1, 0));
+	};
 	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
 
 	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
@@ -838,6 +849,7 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
+	u32 num_lanes;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
 	if (!regs)
@@ -883,6 +895,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 		return pcie->num_clks;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
+	if (ret == 0) {
+		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
+			dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
+		else
+			pcie->num_lanes = num_lanes;
+	}
+
 	return 0;
 }
 
-- 
2.46.0


