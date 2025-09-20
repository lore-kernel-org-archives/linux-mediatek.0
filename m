Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E79CAC597
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qPv4ldTq9iLR5m/Ew1ytbLOJ+vLoqEg9E8nbrL4xZQ=; b=teNXCZ4LkSn+yKu0dCpfeuVNyd
	FxgEcgqkW/KiNl43ArEl4Hg/vAlU7wkgDmIisUp41EQctHjbvkyPAGfjEH+2TgUDVepYygFrjLxPW
	H79gRI0VE2BzQnKWGC0LeyWlgzRaSDwuXCdfckY84UCrM/tnc0ALI81lV9jP/x4UbE12I3PggHXsW
	JOVTbcBIAleJJxFaGbiP5HUx/n4NCrxTHTMs4skgzi0Hu3uHWLMDhe3UHPGMTNBBKub0Snv88J5sW
	nXnFUIjfc0zqOhI1a/gOlQRE8n5zzwWLfeeSuw06QAuo81D1hdOe//gW21O3YhhYIGkOjzlQg6cVX
	WG9YSSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzw0U-00000005GjS-3WZ7;
	Sat, 20 Sep 2025 11:43:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzw0R-00000005Gi7-3E6A
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Sep 2025 11:43:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4687b41fb56so9322885e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Sep 2025 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758368634; x=1758973434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qPv4ldTq9iLR5m/Ew1ytbLOJ+vLoqEg9E8nbrL4xZQ=;
        b=c/fKlpA0RyPaE+CgR5hEGyOnfrOYisL486idxTUozAIusQ2aXvalxJEUEbhtSKAe/Q
         ynQ++rsimGrgV3/AjJYMeGbUF+mrY35IA1aDIiWAoBw31EvsMBz5PK+bnIeIYwyt2TlW
         qJrEuLFteVtA4eZOYf1uJwQhbIumxQ+QE4pkFx4SMMq2KG8rwdTw/OF3KDu83/TFpfNL
         VZX3n/JI8O3gBXKQStmbaA8BtXI7obmKODILvmY7wifhoZyoK3prc02/zLOEiTft4L1g
         c3cmzAGvTrwj2kC7lD6UUgK46sxIeOLWs7+1iE1Lsl3JbZPReK0zkhuRpsfmwqtNEqg0
         TyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758368634; x=1758973434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qPv4ldTq9iLR5m/Ew1ytbLOJ+vLoqEg9E8nbrL4xZQ=;
        b=ZKXB+dGSPdghOxou15KZYXm8QXz9ggdQR1Wga5bNSyZTnKxb8TwhfLp6g/sLXqJBC7
         s2B3UTislOeyOW915B/W0d3FJa2VBh9DSUB6jC8+pt/xdxnI6+SLRLLY01m2mE/khNsv
         kl0wX6wL/wtE5wdpYNxyRZoxzKKxzH0mINNeuqWaD5CQ48p2281vEyR5nW7fWPPDtjWb
         vWSuc8euiLlOpQvqx6EykIEnSfYS9CRFu2Mxb4Rf3K4mm5V32Zk/l5/pOo9UADNGXK7W
         NDQ0QUGp6t2+Omwnz5OMv+jYJJgmCS4of4mNODYv11bzboDyVsM7We2NsCnDEXG7FBOY
         lg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWttzvISQztbRtZZssG+hHOifgZoK6DQYMAZ2CjdDWEzB08URcKEDxD65Igg+a5OMmlNgXv6s2o9nIfAFZ0FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96siO8UEZCFM6Ezlq60A78JoDeu/sw97EMgv45QjnDXmZ3NCe
	d+w7IHN16284woK3uUwCnVN+v6/bBvvJSnZlOJSvsLvngfLVw6cSCZ4Y
X-Gm-Gg: ASbGncu6GC8zYt5pMJNIsg3YX89fKVwvo5HqIQ1PdOrKhp5z7JpC5Cxuscw5KISjwzY
	DbCV7DLCkzP4jcSKKmxFibVb66qLPENb2VO2l61dWwHirFTOhRmvU6OHajLqVoFE6ZVrEufC+Nn
	3g9oZd2x1ZsGL0aN5SxGiPFGwcrfMkR6P9Ee5P+TJkcEn/6FGpe6Ou/gv9YmhjlQXOSE+6ONelz
	YI7wRC1i3cW0LwejC1lEcCJGVvKuyds7DSGZ7JJkzOvfoJNnu6ZJLy3wD3B6LSA9v5TRafEZZ8y
	L+MKmzPWVsLsru5pk4femhpUsdFDAwA0ZY7hfgykHoIlg1J5ASRRCOtRCtwIzjuD20FNrPsCdhW
	5wMWds9UrnfgBcq4sWhBq+janIIXT6JFLsKRZpX+GU304ggz3daqhE3HpeO7PN33dh9YncME=
X-Google-Smtp-Source: AGHT+IGeKLyKQNfti4n7pQMmmIvBvMIuHbECb0sWa4jGH1bzRgL7YqTQVCn/1cA7YHkHgqvs03ymNA==
X-Received: by 2002:a05:6000:40ca:b0:3f0:f7dd:4b76 with SMTP id ffacd0b85a97d-3f0f7ec90c5mr4643851f8f.15.1758368633761;
        Sat, 20 Sep 2025 04:43:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f305f837c5sm3392172f8f.47.2025.09.20.04.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 04:43:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Sat, 20 Sep 2025 13:43:23 +0200
Message-ID: <20250920114341.17818-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_044355_831333_F3AB63FE 
X-CRM114-Status: GOOD (  19.36  )
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

Add support for the second PCIe line present on Airoha AN7583 SoC.

This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
also require workaround for the reset signals.

Introduce a new bool to skip having to reset signals and also introduce
some additional logic to configure the PBUS registers required for
Airoha SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 84 +++++++++++++++++++-------
 1 file changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 24cc30a2ab6c..ad7d47c18f0f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -156,6 +156,7 @@ struct mtk_pcie_soc {
 	bool need_fix_class_id;
 	bool need_fix_device_id;
 	bool no_msi;
+	bool skip_pcie_rstb;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
@@ -679,28 +680,30 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
 	}
 
-	/* Assert all reset signals */
-	writel(0, port->base + PCIE_RST_CTRL);
-
-	/*
-	 * Enable PCIe link down reset, if link status changed from link up to
-	 * link down, this will reset MAC control registers and configuration
-	 * space.
-	 */
-	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
-
-	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
-	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
-	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
-	 */
-	msleep(100);
-
-	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
-	val = readl(port->base + PCIE_RST_CTRL);
-	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
-	       PCIE_MAC_SRSTB | PCIE_CRSTB;
-	writel(val, port->base + PCIE_RST_CTRL);
+	if (!soc->skip_pcie_rstb) {
+		/* Assert all reset signals */
+		writel(0, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Enable PCIe link down reset, if link status changed from link up to
+		 * link down, this will reset MAC control registers and configuration
+		 * space.
+		 */
+		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
+		 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
+		 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
+		 */
+		msleep(100);
+
+		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
+		val = readl(port->base + PCIE_RST_CTRL);
+		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+		       PCIE_MAC_SRSTB | PCIE_CRSTB;
+		writel(val, port->base + PCIE_RST_CTRL);
+	}
 
 	/* Set up vendor ID and class code */
 	if (soc->need_fix_class_id) {
@@ -1105,6 +1108,33 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		goto put_resources;
 
+	if (device_is_compatible(dev, "airoha,an7583-pcie")) {
+		struct resource_entry *entry;
+		struct regmap *pbus_regmap;
+		resource_size_t addr;
+		u32 args[2], size;
+
+		/*
+		 * Configure PBus base address and base address mask to allow the
+		 * hw to detect if a given address is accessible on PCIe controller.
+		 */
+		pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+								   "mediatek,pbus-csr",
+								   ARRAY_SIZE(args),
+								   args);
+		if (IS_ERR(pbus_regmap))
+			return PTR_ERR(pbus_regmap);
+
+		entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+		if (!entry)
+			return -ENODEV;
+
+		addr = entry->res->start - entry->offset;
+		regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+		size = lower_32_bits(resource_size(entry->res));
+		regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
+	}
+
 	return 0;
 
 put_resources:
@@ -1205,6 +1235,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
 	.setup_irq = mtk_pcie_setup_irq,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
+	.skip_pcie_rstb = true,
+	.need_fix_class_id = true,
+	.need_fix_device_id = false,
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_v2,
+	.setup_irq = mtk_pcie_setup_irq,
+};
+
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.need_fix_class_id = true,
 	.need_fix_device_id = true,
@@ -1215,6 +1254,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0


