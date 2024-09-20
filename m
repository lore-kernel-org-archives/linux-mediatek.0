Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E4CF58F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oyen1UstytXVliak2qPWo/M2CoTkub/pUpEMfICyPPQ=; b=C0o9eXNXBUSGXB04E1ZGK6nsAh
	4HkYLzmstuGElJ6rbhHca+mlCHwfIDd0sQp9GDwbXyNrh5247Rhto1/W/j5w2RW1Lx08APYs/XvgX
	Ij9HhQ4mAVengFZb65nhUN3/7P+4/pK/hDdEQXq5WTAutZyw6wxMyYR82RM07FgxWl5ICrkaiCtzU
	acciZ85ecIRk/sDvA2dK/tMGq7hjjKt7QKCigp+Kym+/39LUlCopADZswSdAmf/yLKgqdPTl3nkhz
	3YcixoSjCgDKgT+oVzOBANnZRpHtlWvfSKQua9ig3nQaoO2WDrwGq+Vq/CJInGra2QZmTdUMBjXAF
	9KheDP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZJA-0000000Bp9R-08ns;
	Fri, 20 Sep 2024 08:48:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYyh-0000000BlMh-1GL0;
	Fri, 20 Sep 2024 08:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 045905C0352;
	Fri, 20 Sep 2024 08:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137D5C4CEC3;
	Fri, 20 Sep 2024 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820818;
	bh=H2LIdhRhxjrQJxmI8WnB/ccDyKadwdonPwj1FgH9vyY=;
	h=From:Date:Subject:To:Cc:From;
	b=ZY10/WQxYCoIIGfMOa4HuotBRNkoyiE89E0ugP8t83zxHzwswrodZOLx9Awxoitjn
	 16dX9XDKE8rmUZw/GRe+4LBtmxcb23m9XNTeB9W033fQiFTa/XBr8f/78RT5H7D/NM
	 ZXxF3zmcD7Wnu2S5bTz25EupL1KRwgsXudcM04pUwmIakT3e9nhoVk/xnbW3vSVylD
	 FRx1rxABxJYtzqirpT6Aj5o/0R6V3+uxjLQnyIif3fbCeKNqz75FdVMENf7IP0us3n
	 aQkBFPa+i6RqMWoWsBPZ922+ELtu+Hy9RY8LcWLGWCNrbB5LDJCqNUNd+VeuJDKpug
	 kn6kRznFtH8DQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 20 Sep 2024 10:26:28 +0200
Subject: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha EN7581
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-pcie-en7581-rst-fix-v1-1-1043fb63ffc9@kernel.org>
X-B4-Tracking: v=1; b=H4sIALMx7WYC/x2MQQqAIBAAvxJ7bsG1Musr0SFsq71YaEQg/j3pO
 AMzCSIH4QhjlSDwI1FOX4DqCtyx+J1R1sKglW7VoBVeThjZ950lDPHGTV60ZMh01lHjWijlFbj
 o/zrNOX+xlYJgZQAAAA==
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, Hui Ma <hui.ma@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_012659_469369_A5B3AE5A 
X-CRM114-Status: GOOD (  14.57  )
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

The PCIe controller available on the EN7581 SoC does not support reset
via the following lines:
- PCIE_MAC_RSTB
- PCIE_PHY_RSTB
- PCIE_BRG_RSTB
- PCIE_PE_RSTB

Introduce the reset callback in order to avoid resetting the PCIe port
for Airoha EN7581 SoC.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 44 ++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 5c19abac74e8..9cea67e92d98 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -128,10 +128,12 @@ struct mtk_gen3_pcie;
 /**
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
+ * @reset: pcie reset callback
  * @phy_resets: phy reset lines SoC data.
  */
 struct mtk_gen3_pcie_pdata {
 	int (*power_up)(struct mtk_gen3_pcie *pcie);
+	void (*reset)(struct mtk_gen3_pcie *pcie);
 	struct {
 		const char *id[MAX_NUM_PHY_RESETS];
 		int num_resets;
@@ -373,6 +375,28 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
 	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
 }
 
+static void mtk_pcie_reset(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+
+	/* Assert all reset signals */
+	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
+	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+	/*
+	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
+	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
+	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+	 * for the power and clock to become stable.
+	 */
+	msleep(100);
+
+	/* De-assert reset signals */
+	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
+	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+}
+
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 {
 	struct resource_entry *entry;
@@ -402,22 +426,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
-	/* Assert all reset signals */
-	val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-
-	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
-	 * and 2.2.1 (Initial Power-Up (G3 to S0)).
-	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-	 * for the power and clock to become stable.
-	 */
-	msleep(100);
-
-	/* De-assert reset signals */
-	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
-	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	/* Reset the PCIe port if requested by the hw */
+	if (pcie->soc->reset)
+		pcie->soc->reset(pcie);
 
 	/* Check if the link is up or not */
 	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
@@ -1207,6 +1218,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 
 static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
 	.power_up = mtk_pcie_power_up,
+	.reset = mtk_pcie_reset,
 	.phy_resets = {
 		.id[0] = "phy",
 		.num_resets = 1,

---
base-commit: f2024903cb387971abdbc6398a430e735a9b394c
change-id: 20240920-pcie-en7581-rst-fix-8161658c13c4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


