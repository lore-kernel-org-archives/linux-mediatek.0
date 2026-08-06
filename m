Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDA8C5AC7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg5FdjePWRklsBJbX6Npe19S1RoA39DQ5iJXo4rcmgc=; b=3WlP8P7KtObP2VtTHNX1LvcIq5
	MR6XPht2BA3zM5VJH4K3r/SzKbXBIhV21dvuQ/P4g+6K5p7ON4r0oNyJzXnQRUZY/p18QOpxBRmk9
	Au/5lVyJcsHa9HjjzXCjPXbk4iXHgkJiD44o/UFa/lPu4EOXevtclXGQTiZf0wyYON3MJPA+Y2Uo9
	mL4S1GI1lPzHE/HSiPSSl9PmwoqgVobAs+6CmtXh4/4UnhaR0cdVGcfJRrZlcrP99+4HtJSFMtztN
	Z7opds0o5WJNGjqGxHrtg7z75dMdF6oUDgvgecjvrMv07e/lZAL7+1ZyMRIl568fs1DrvflSs0R5y
	OL4oRlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Lr-00000006GSh-2aDo;
	Thu, 06 Aug 2026 16:53:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Lo-00000006GP7-3s1i
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 16:53:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47fe377a217so1635645f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035227; x=1786640027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tg5FdjePWRklsBJbX6Npe19S1RoA39DQ5iJXo4rcmgc=;
        b=cnMiNqJ7ctmY18Mb8fR56FiFH4c/p9Sjx5dIrU/wqVVXECfR6oYFyDp3oY23OO9DMQ
         W6q/w9lmmkj/9YHSBBqrvVUW2tttmLLmV/nfRn6d+AutjQBs1xPAcC4NLg7MRnRxotBV
         7FZSgttjrWAd4hBD6v1cUcNrr/vvZqUMTc56WXcwWk47j2y335bQWJGwaLnvQnBSK+MG
         4putoFRg6ujmtKlHBjNxlCxCk8RcZpVFeFFmSATYTbDBCePl6DnpODaB4Fv9ytZE5ssr
         1Dnmb2O3b7y0QYDecJ3743UuseGc0sJHEUmaYa0SttZnchGTE76kQkXjQC56Ukn8Xn0v
         Tfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035227; x=1786640027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tg5FdjePWRklsBJbX6Npe19S1RoA39DQ5iJXo4rcmgc=;
        b=dta7Xu7Dzr6UkH6lSwdFP2/r8Qj1ntkkc6/uuvgemmLqtH8dv/o4h2QYi0Lvxq6epk
         fF90sogxUuAzbK4BdXkVuJ3pLqHH3RR6ePy6DBowAD4N5MH+zaVMQBy8qRVkyQNhpaFv
         SOFXIla3u6kA81tCHVg4RqWbScdSDX3aeK67NfJIZQjCUn4ik/rmCQRGltL67EizWvRW
         3vazPkF7ftFUBfwjuXJ8ayxAFuXuDJHoz8ApKBaNKIAv5P9Ug3u5bC1HLX5vvaPjxGVU
         a1e/1QLawpjH+bQ62l0YqBeVvZS6ZNV4GDQGMjMjhntafTKUpcSeKj0QbJa/ExMKLlAI
         xHHA==
X-Forwarded-Encrypted: i=1; AHgh+Rou7alumvcCoY1XN23N7hQhRPPpBbvn7fTSRWGPRFNVWHfyfrNSSsCgNTkTdqYSroVeKxPi+9mremXLCn+moQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7cP7TcIXn0FFSPglMUWdXSPeR7bpzvJPnaA2Q0e6XivxRy1dH
	SS0nrjIkjvra0qNcNjJP/Paob3MLV1F71NiNeohqbzE8iDJ7c6Zba1xN
X-Gm-Gg: AR+sD104YQwOn+wnmuxyWx+RPb1CHUCbBkUN/i/t1zgDXfse9/Lcd9VHGh2qngRG72Z
	Q96cyzKnnGNm5HpJEIoDnQ+pn24NPReogMQaOOymX4vKZX38pqa2c1c5TkF3mRLclM6754IcXCF
	gMGm+p5JXjr+zOHRmcxhDA5lmmSgrVe5ucE02T4n9j2krqPPOsrean9QyE1BRS0N02pDNnBW8Oe
	XF919zOl+PQ/dwff1VZIpGUDp33ssF0Q+mP9N0Bx1R2GUEvbxLJmipAPRxQaDxGU8+AhW9FkOzb
	qv2UzLcz0CbQH1ZUXQV8rtfAhGByTcsBg1iqmWxV0Ko+E0EQMtsEE7Ngn8N0eN3C5bMKmgkDlpi
	rkvraXhILj2hoHlBCAuSAYbjVUjOtveWB0bNYY5/D6MLr2mHV2gKQFg0d+Hr1YS4ETRUdUZm/O9
	JUc3FQ+NM5nT/nLyKpiPnKmxP27wH+zLz9U2DqSWCk3PlsdKCnqjnLI01EoslFUQMNlbIs3ZE52
	WlW932v3xy9F7nt+2PfOTQld3jMJ2id2H2hp8lIUxv4ojJ2hMlOMg==
X-Received: by 2002:a5d:6a4e:0:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fec4edc2amr21933554f8f.8.1786035227056;
        Thu, 06 Aug 2026 09:53:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79a7f07sm8070586f8f.8.2026.08.06.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:53:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Thu,  6 Aug 2026 18:53:32 +0200
Message-ID: <20260806165334.7328-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_095349_087812_58736FAD 
X-CRM114-Status: GOOD (  26.36  )
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

The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
done by configuring the PCIe MUX in the SCU register.

To correctly configure PCIe0 in x2 link, define in DT the following
additional properties:

  - additional reg, 'sec-pcie-mac' for the secondary PCIe.
  - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
    'sec-perstout'
  - 'airoha,scu' property to correctly configure the SCU register for the
    PCIe MUX
  - 'num-lanes' set to '2' to enable PCIe0 in x2 link

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe link, additional logic is added
to assert and deassert the PERSTOUT resets. Support of these additional
reset was introduced in Airoha clk driver with commit
6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
and on backporting of this commit also the clk driver change will be
needed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 106 ++++++++++++++++----
 1 file changed, 89 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..c8300c47374b 100644
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
@@ -928,6 +936,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
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
@@ -949,18 +965,38 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 			pcie->num_lanes = num_lanes;
 	}
 
+	/* Map secondary PCIe for 2-lanes mode for EN7581 */
+	if (pcie->num_lanes == 2 && device_is_compatible(dev, "airoha,en7581-pcie")) {
+		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
+		if (!regs)
+			return -EINVAL;
+		pcie->sec_base = devm_ioremap_resource(dev, regs);
+		if (IS_ERR(pcie->sec_base))
+			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
+	}
+
 	return 0;
 }
 
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	unsigned int num_lanes = max(1, pcie->num_lanes);
+	struct regmap *pbus_regmap, *scu;
 	struct device *dev = pcie->dev;
 	struct resource_entry *entry;
-	struct regmap *pbus_regmap;
 	u32 val, args[2], size;
 	resource_size_t addr;
-	int err;
+	int i, err;
+
+	if (num_lanes > 2)
+		return dev_err_probe(dev, -EINVAL, "unsupported num-lanes, maximum 2 lanes supported\n");
+
+	if (num_lanes == 2) {
+		scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
+		if (IS_ERR(scu))
+			return dev_err_probe(dev, PTR_ERR(scu), "failed to map SCU regmap\n");
+	}
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -992,6 +1028,19 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	size = lower_32_bits(resource_size(entry->res));
 	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
 
+	/* Assert PERSTOUT for all relevant lanes */
+	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+					pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to assert PERSTOUTs\n");
+		return err;
+	}
+
+	/* Configure SCU MUX to disable PCIE1 for x2 lanes mode */
+	if (num_lanes == 2)
+		regmap_update_bits(scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
+				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.
@@ -1024,18 +1073,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
-	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
-	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
-
-	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
-	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
-	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
-
 	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
@@ -1043,14 +1080,47 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	}
 
 	/*
-	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
-	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
-	 * complete the PCIe reset.
+	 * Old Airoha EN7581 clock driver performed PCIe reset via
+	 * clk callbacks since it has a hw issue with PCIE_PE_RSTB signal.
+	 * This is now handled by dedicated PERSTOUT resets with clk
+	 * driver only enabling the refclk.
+	 *
+	 * Wait is still needed for refclk to stabilize
 	 */
 	msleep(PCIE_T_PVPERL_MS);
 
+	/* Configure all the lanes to the same EQ config */
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
+	/* Deassert PERSTOUT for all relevant lanes */
+	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
+					  pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PERSTOUTs\n");
+		goto err_perstout_deassert;
+	}
+
 	return 0;
 
+err_perstout_deassert:
+	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
 err_clk_prepare_enable:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -1136,6 +1206,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
+	reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+				  pcie->perstout_resets);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
 				  pcie->phy_resets);
 }
-- 
2.53.0


