Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E4CCDE012
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVSNnx6r2pF6bXOmuirL1YtxX4Xz3CG4Q/di0IqvFXg=; b=Gt/npD9sPntf+cBY+37ZnDJJIq
	Ady9Qh5Zn3S22ovjBRRpuxQ8oE0tT6EaV3eL7dDHBGLw1nQRaBpgrVKeSJOlN3yz7W0sI1P44AJQ8
	z/JapE61/RucN3sS49a6UDNgxV2wcoiN5PYFd41CkWlG06zfI0Al1x28AzfOskGBh4gYK+d/aM+8u
	3zmSjxWFi1R8PtiaWFmT7EEA7dX8oW9Gvp5C50SdJCkSXgYDXXbrsR1YHzA0A7p//8Wu9D4Brq4Vl
	OSUOaKAe+JKEtGTKX0ybTAXcBMI4SWagTE38SwgDIP3OqWenoFeFkg1Z8ZbVLSVy4ith9qfbAPylI
	KWGjKS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5P-00000009tn1-3IuL;
	Thu, 25 Jun 2026 21:58:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5H-00000009tgL-05QM
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso13169305e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424685; x=1783029485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVSNnx6r2pF6bXOmuirL1YtxX4Xz3CG4Q/di0IqvFXg=;
        b=qHyDaVmxKroXzuTkPo56QYjP7aNbX7lmIbaLqyA79n5b4ieB50EPjQb2HIR+myTfdv
         18NaG3PuhQTiEambswnQCipMeZkWWVuhELavlcAqsb4XuQwCe9ofQd2vkgYMaD0oJOkQ
         hhB70vchXM+rPlPWqsjNbaZ2iXP2uibtsW9BR9hVNMnTZf5heBZIIc5YJLs+2R3Uk4JG
         9pJ//2WT/XRvLPyvQ4eIVDK+BmSmw8/GVePYT6adWmAV5iohvilXYwSV1Z4py/UZQLWe
         xzdpoUNZccDr2fSpD8mFrA4UIOOemxEz2sXqh01P/eAkkcnNAmtP7GbeknTenFLCCoQS
         BFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424685; x=1783029485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVSNnx6r2pF6bXOmuirL1YtxX4Xz3CG4Q/di0IqvFXg=;
        b=FpPOgGWhXXOzgfhZL/FC+1WFyqtyXrHL0zBHKRlchAkH4TJhQy/Uwwp7J2UKMuGiT3
         aQ9I46O46/bus9vjAkei6WMf/Iu6baYUzfBByIRL05L8qq3yB/ZYvwQjgRqOsJnTPSWS
         zN5VDGND1gATPxMBpz+NCe7a8hQzLqvY/+EF6AwYFAAGjdk8tczgEaweGiOqO1iJX5P6
         hNk1T1tBc9WE7ivu/6SlPSpxiv/+7bUv4IgrgbkYer4mWaOIMGmxTHug7X+PLtX4xlbv
         jFMcKHltHmesJ/z+qP7kzxD3ScsA1i411dEcqsBaUh3q9zDdrplMorujSmdzLnvvDiu/
         JTYA==
X-Forwarded-Encrypted: i=1; AFNElJ/1DP2PJ0LCnB3wCn53E0RD4VdRVX1qYbD6DaDYihbMae8gfCB6Q166QohLe2gQVvJGW4TuZoGT3j18UbWAuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRM/T9cuHZjcmPXM1F3nG+quJ2wJDDGsQX81/O188QUfUUWTS+
	3LR1RvxYE5UURukAhX2G8wn2g1KSdqAiPjDrjS/BOA6A6YjfVtJVaHRO
X-Gm-Gg: AfdE7cnPRGgFzWdnPMBXEq2SlMTLHBZ8ykag3EKt6613NYbAwrpkw+a32BMd1Lxa/pB
	wy4wUDtaoAn2E5CaG6DF0dFlSNtnwnZAy+44IZ0ysf5QGaiDQOp36ldVviFlLKFg3qqWRixvbhm
	12MbuRWCcziz3eytqPYXsBV6kClk1TLRKxxKl2uCWjLI4nvyfoE+LrTfzk3VEWbPsN1f/dq3XsW
	gbFibV/kvh5nWI952oyOLDcD04biVu2nEJ0f076HSChT+W5JBzF7rX60HitxtAbHvH5c0sfl4p+
	RKhz0tV/BbS3B7PJg4R47q1lNW/4G5r6qPG6bMLLdawjEVu8oSQquxX57uuDUpHkTPDm4eFmy6o
	OX5hSNuv8NtrP96hEK0vtftAGSqGZqBpedQnHPPmkkqfjIXvxpUAY/NfskfBsgW4uaTqSDMF4N0
	8uSYo2u+yub5hkl5m3b197AXUbnbx/KowOBE40MVEMN5I3p+ilnio0aG0DiArz25267UvtHyd/s
	XBlm3jT8EniGC8MbFtLYkY=
X-Received: by 2002:a05:600c:c059:10b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-4926641a8d8mr43206365e9.12.1782424684976;
        Thu, 25 Jun 2026 14:58:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:58:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Thu, 25 Jun 2026 23:57:37 +0200
Message-ID: <20260625215741.3253212-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145807_107500_29373CD6 
X-CRM114-Status: GOOD (  24.32  )
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

The Airoha AN7581 SoC supports configuring the first PCIe0 line to 2-lanes
mode by bonding it with the second PCIe line. This is done by configuring
the PCIe MUX in the SCU register.

To correctly configure the line for 2-lanes mode, it's required to define
in DT an additional reg, 'sec-pcie-mac' for the secondary PCIe.
It's also needed to define the additional reset and the PERSTOUT reset.
Also 'airoha,scu' property is mandatory to correctly configure the SCU
register for the PCIe MUX.

Finally to toggle 2-lanes mode, it's needed to define in DT 'num-lanes' as
2.

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe line, additional logic is added
to assert and deassert the PERSTOUT resets.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 98 +++++++++++++++++----
 1 file changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..f750759bbc1d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -32,6 +32,11 @@
 
 #include "../pci.h"
 
+/* AN7581 SCU register */
+#define SCU_PCIC			0x88
+#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
+
+/* PCIe register */
 #define PCIE_BASE_CFG_REG		0x14
 #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
 
@@ -131,6 +136,7 @@
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
 #define MAX_NUM_PHY_RESETS		3
+#define MAX_NUM_PERSTOUT_RESETS		2
 
 #define PCIE_MTK_RESET_TIME_US		10
 
@@ -203,9 +209,11 @@ struct mtk_msi_set {
 struct mtk_gen3_pcie {
 	struct device *dev;
 	void __iomem *base;
+	void __iomem *sec_base;
 	phys_addr_t reg_base;
 	struct reset_control *mac_reset;
 	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
+	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS];
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -222,6 +230,9 @@ struct mtk_gen3_pcie {
 	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
 
 	const struct mtk_gen3_pcie_pdata *soc;
+
+	/* AN7581 specific */
+	struct regmap *scu;
 };
 
 /* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
@@ -928,6 +939,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
 
+	pcie->perstout_resets[0].id = "perstout";
+	pcie->perstout_resets[1].id = "sec-perstout";
+
+	ret = devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PERSTOUT_RESETS,
+							     pcie->perstout_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");
+
 	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
 	if (IS_ERR(pcie->mac_reset))
 		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
@@ -955,12 +974,29 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	unsigned int num_lanes = max(1, pcie->num_lanes);
 	struct device *dev = pcie->dev;
 	struct resource_entry *entry;
 	struct regmap *pbus_regmap;
 	u32 val, args[2], size;
 	resource_size_t addr;
-	int err;
+	int i, err;
+
+	if (num_lanes == 2) {
+		struct platform_device *pdev = to_platform_device(dev);
+		struct resource *regs;
+
+		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
+		if (!regs)
+			return -EINVAL;
+		pcie->sec_base = devm_ioremap_resource(dev, regs);
+		if (IS_ERR(pcie->sec_base))
+			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
+
+		pcie->scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
+		if (IS_ERR(pcie->scu))
+			return dev_err_probe(dev, PTR_ERR(pcie->scu), "failed to map SCU regmap\n");
+	}
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -1024,34 +1060,60 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
-	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
-	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
+	/* Assert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+					pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to assert PERSTOUTs\n");
+		goto err_perstout_assert;
+	}
+
+	/* Configure SCU MUX to disable PCIE1 for 2 lines mode */
+	if (num_lanes == 2)
+		regmap_update_bits(pcie->scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
+				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
 
-	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
-	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
-	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
 
 	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
-		goto err_clk_prepare_enable;
+		goto err_perstout_assert;
 	}
 
-	/*
-	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
-	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
-	 * complete the PCIe reset.
-	 */
+	/* Wait for refclk to stabilize */
 	msleep(PCIE_T_PVPERL_MS);
 
+	/* Configure all the lines to the same EQ config */
+	for (i = 0; i < num_lanes; i++) {
+		void __iomem *base = pcie->base;
+
+		if (i == 1)
+			base = pcie->sec_base;
+
+		val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
+			FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
+		writel_relaxed(val, base + PCIE_EQ_PRESET_01_REG);
+
+		val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
+			FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
+		writel_relaxed(val, base + PCIE_PIPE4_PIE8_REG);
+	}
+
+	/* Deassert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
+					  pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PERSTOUTs\n");
+		goto err_perstout_assert;
+	}
+
 	return 0;
 
-err_clk_prepare_enable:
+err_perstout_assert:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
-- 
2.53.0


