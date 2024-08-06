Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CFCC52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jqhjvzQ/FPLz1d6c7zEKQLmyQTkCaXyYpYFtd3LTmg=; b=sdxwW5MkguoxfpYlAXeeruPcEc
	28/PJKEUb/lL1dALaFHhLuPllE05Y94Yxt40HQgR9IteX3U894talVZntN2Annhx2Ggty5ll/O/HI
	/XlfY0qihzZe8rwpJ+gAJAqRjT6cZxMeGVSZSk/p+S1S7VyYaw80ZzmRIyyOcGggtO/5JhZ6VqgSn
	XZEbLZRTZF6ILwrq7SFz8BGKf5Ube4kEZcluecLvROuz/EEdflRefNcBXhqJFHl01DHKKmqr4/01C
	Iq1HNS4aJdgg4QmdvrX//Ukat1Skb7DrTUrP2lgE9BILdhvI78eNFHvQuclN5o48ykADlKPJ8zXf5
	E9TgQvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGoE-000000018vB-05l4;
	Tue, 06 Aug 2024 09:48:50 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGoA-000000018uG-3o1P;
	Tue, 06 Aug 2024 09:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722937720; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cO21j/DmKuLnwAifaLnEc+0CkD7YvF/ie0hc87FJuoUoeqkRaUjmMCJh2EQjeoFquepAMhnNb6qCyK+/y67anTWh1Zmjy2PmlJBOx+wxyOWOFCMaGRf0gMzGwbvikSoJ/D0tLhtjy0fB+w331XcHKb63WfPneSZgyMUbBA87HtE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722937720; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+jqhjvzQ/FPLz1d6c7zEKQLmyQTkCaXyYpYFtd3LTmg=; 
	b=W2anfFn55Jsc31ROFRWRMjIybuzXceWk8lmtmdyoTS8Y3HmvidBL1YYFPA78sJPZ/+Y4FLaoirxPuzVmbu/h2zC4dzsHD7G1V79xWhL2terFjPTYvopaV5G0oWq8rokauNj0Q3NPsbPGQaoDrGBonSs4VqtA4f3Ebgg12oXy6wo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722937720;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+jqhjvzQ/FPLz1d6c7zEKQLmyQTkCaXyYpYFtd3LTmg=;
	b=EKRGOGE1+2vpeRabrjCH+qv3BCJW/qwh9/NMKiCdTbjNy7snZ2TqFeFSGSAMUMwv
	i6jaEET2RCyO190wQhRXnH0Ss+jOV0V/S4XHlxY96Gp7QY/KDf+PzpkmzrsH/eobXdh
	aixcdnuUGhsA5nE2UMBa2g+CIeqDfvrYsZuALfdE=
Received: by mx.zohomail.com with SMTPS id 1722937718892770.851054340109;
	Tue, 6 Aug 2024 02:48:38 -0700 (PDT)
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
Subject: [PATCH 1/2] PCI: mediatek-gen3: Add support for setting max-link-speed limit
Date: Tue,  6 Aug 2024 11:48:15 +0200
Message-ID: <20240806094816.92137-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806094816.92137-1-angelogioacchino.delregno@collabora.com>
References: <20240806094816.92137-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_024847_020049_2BCC5D0E 
X-CRM114-Status: GOOD (  18.55  )
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
 drivers/pci/controller/pcie-mediatek-gen3.c | 56 ++++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b7e8e24f6a40..905dc635ead3 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -6,6 +6,7 @@
  * Author: Jianjun Wang <jianjun.wang@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -24,7 +25,11 @@
 
 #include "../pci.h"
 
+#define PCIE_BASE_CFG_REG		0x14
+#define PCIE_BASE_CFG_SPEED_MASK	GENMASK(15, 8)
+
 #define PCIE_SETTING_REG		0x80
+#define PCIE_SETTING_GEN_SUPPORT_MASK	GENMASK(14, 12)
 #define PCIE_PCI_IDS_1			0x9c
 #define PCI_CLASS(class)		(class << 8)
 #define PCIE_RC_MODE			BIT(0)
@@ -100,6 +105,9 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
+#define PCIE_CONF_LINK2_CTL_STS		0x10b0
+#define PCIE_CONF_LINK2_LCR2_LINK_SPEED	GENMASK(3, 0)
+
 /**
  * struct mtk_msi_set - MSI information for each set
  * @base: IO mapped register base
@@ -122,6 +130,7 @@ struct mtk_msi_set {
  * @phy: PHY controller block
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
+ * @max_link_speed: Maximum link speed (PCIe Gen) for this port
  * @irq: PCIe controller interrupt number
  * @saved_irq_state: IRQ enable state saved at suspend time
  * @irq_lock: lock protecting IRQ register access
@@ -141,6 +150,7 @@ struct mtk_gen3_pcie {
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	u8 max_link_speed;
 
 	int irq;
 	u32 saved_irq_state;
@@ -340,11 +350,27 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	int err;
 	u32 val;
 
-	/* Set as RC mode */
+	/* Set as RC mode and set controller PCIe Gen speed restriction, if any */
 	val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
 	val |= PCIE_RC_MODE;
+	if (pcie->max_link_speed) {
+		val &= ~PCIE_SETTING_GEN_SUPPORT_MASK;
+
+		/* Can enable link speed support only from Gen2 onwards */
+		if (pcie->max_link_speed >= 2)
+			val |= FIELD_PREP(PCIE_SETTING_GEN_SUPPORT_MASK,
+					  GENMASK(pcie->max_link_speed - 2, 0));
+	}
 	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
 
+	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */
+	if (pcie->max_link_speed) {
+		val = readl_relaxed(pcie->base + PCIE_CONF_LINK2_CTL_STS);
+		val &= PCIE_CONF_LINK2_LCR2_LINK_SPEED;
+		val |= FIELD_PREP(PCIE_CONF_LINK2_LCR2_LINK_SPEED, pcie->max_link_speed);
+		writel_relaxed(val, pcie->base + PCIE_CONF_LINK2_CTL_STS);
+	}
+
 	/* Set class code */
 	val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
 	val &= ~GENMASK(31, 8);
@@ -887,9 +913,21 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 	reset_control_assert(pcie->phy_reset);
 }
 
+static int mtk_pcie_get_controller_max_link_speed(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+	int ret;
+
+	val = readl_relaxed(pcie->base + PCIE_BASE_CFG_REG);
+	val = FIELD_GET(PCIE_BASE_CFG_SPEED_MASK, val);
+	ret = fls(val);
+
+	return ret > 0 ? ret : -EINVAL;
+}
+
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 {
-	int err;
+	int max_speed, err;
 
 	err = mtk_pcie_parse_port(pcie);
 	if (err)
@@ -908,6 +946,20 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
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
+				"Max controller link speed Gen%u, override to Gen%u",
+				max_speed, pcie->max_link_speed);
+		}
+	}
+
 	/* Try link up */
 	err = mtk_pcie_startup_port(pcie);
 	if (err)
-- 
2.45.2


