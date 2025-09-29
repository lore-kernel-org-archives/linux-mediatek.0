Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755AECCA470
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfCCKZmM8pHKKYsT+xDhYQD00mwQ4CthcxXjlQ/ajbw=; b=iypIAsKD+slqRG/dcnA05MJAiz
	1VnFj2fphr8U+bwec8LlS9UwoXypo8xPuzU4SVniZk4JzBi+F37MAM9q/M3L/pb27arIFt4FEab1+
	Ee83+Uy7hT/GXBUpggoz+NBImxrN7CGIUZ2xyq55UoqixQyqedaUA+taIDR/yFaAenmEzvUl1eFt1
	2MdoT65ZYwKHbmDWd32CDLHmFBfFXEXcvZEinFkIqilErWf1LojgqAAMzvCs5xTiIwzTgS3TooG++
	zU3quWRfQbH3vBU8mWBOYLtpApN93wZZ+WQsJJvTKzawF02C7o38Of9wfNUPcQ+rhcqN74r8y6QOt
	Q2fmN7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD7-00000002MVX-1Vdr;
	Mon, 29 Sep 2025 11:38:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD2-00000002MOR-3Iy0
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so34054815e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145903; x=1759750703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfCCKZmM8pHKKYsT+xDhYQD00mwQ4CthcxXjlQ/ajbw=;
        b=ET0Nhi9pQfrusqFNjteTWwfTnEAC+wl9U1/QtHNHPSoQOEvZbX9NaXL+u1FDn2BSVc
         3DuAL3SzCPxNgwRFgnkL3JAhL3PNALUP28Z4EnovV7KRg+C4JRKSahFCHYMZqB4A4xvN
         XTuLs6aYGb74mcEHObRS/3CEBapJlXWAQI3TxdK+Z2106UtR42ug5/GPXmditOf930Ir
         czLzeAlgxPP76X1Tn0DRpwu89C6dWiksbl8Svm+2B8liA4eYxvCzNoa8QDM1vgbL1uCL
         XHtgAVbxdktaab3bgSxRIF+JQ2SuscI0bH9w03G4qxanqv4WIPL48DHmLc326emIAYbN
         +gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145903; x=1759750703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfCCKZmM8pHKKYsT+xDhYQD00mwQ4CthcxXjlQ/ajbw=;
        b=oBY3JSrPkqRGTaUyV95pb5mL3BUOIkKi1pzQAW9goMUnsO9iFxNUrU2/QjZNhH94B6
         5i/Uy6VKqF+xqUBZXm/ntXfZ6V1gF7aFy2G6RJK08AuvqvrdkQRwWGClSBF40zeOq3gB
         vOEJpx+7hGQWznjQCxRMdJYDrcuhwouaJnhCzBRiX0LEs6+KNHoSWIrvqA0+zyxEUhPr
         24T84Sp05kPZgi5xsoCG0bsmHaaro4zmOjpzrVHi0z0kYpUIM7JAnb24LQjkHCcLO6HN
         2kuMXreCad9HQIW6EpvX/zBr+VMv/M/VLPNarIDIlzKFee91BjzPmR3jCSEIK2BriXyw
         tWqw==
X-Forwarded-Encrypted: i=1; AJvYcCU8UYO8su3SpJZG+ZazQrKZi+dcKWkTn8EB4PvgQ4/G04Klt86ZRMqty+uV7oHlXpU40kzm8nkYKyxxI3yyuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyDWWjSgZBEbQBxTJGc+7L8dgJmO8FS0u78+nZqE5KdPxKNvZV
	62pShjDJ4tk98aePhtCsyxSccLtY5h90BAtTb6Dci903uI6xXKejsfXx
X-Gm-Gg: ASbGnctzPwtp4Ply/08qxoLVa0cOhIGHo7IgUrEZub3LG6PrIRwO69Oe5SFVDh83l32
	LoWu8PicMYL/jWjntWYz3jcp7Iz/zKSrjdrhi9IkScPJcXOS2KhYzAOulQC1i0QoQvHerlAxz+H
	x9yY3pYJxotQpm5Q+HR09hFOG/8axexRhgHWwKxBrXU4wk7WJEKYGetA0nlYlwSYS7dnl+QNtml
	9eqvYs0nlGTaj/Rtn3R5o9t/bva4+vqaLXGlQZdNLCDx5CFA9FCCNAgGDJCiQ3w+tX6O+8ZOCfS
	y32Y/lFLsXfRuwNjBxw1n5AkuLEMbfd9WwUmIW1qY9gxR2E3anQTaXwsVDal764q/gbLoH9Ybfx
	z5IGc9IEbPf39r+vOgPjSlUW5iT0hjyzAkcMqR4Bfk79nqYAXli5yAlFhkiYZJjeGA/RQFt1XDE
	Im4Dv3ag==
X-Google-Smtp-Source: AGHT+IHyG6lnL8qQ0LD131D8WPiKwUrMMhMJ4PKeOnuBD/ytBbwWaTjIucbfk9dUwJTA+msn8KI/1A==
X-Received: by 2002:a05:600c:608d:b0:46e:4f25:aace with SMTP id 5b1f17b1804b1-46e510d28edmr38669385e9.6.1759145902845;
        Mon, 29 Sep 2025 04:38:22 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/5] PCI: mediatek: add support for Airoha AN7583 SoC
Date: Mon, 29 Sep 2025 13:38:04 +0200
Message-ID: <20250929113806.2484-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929113806.2484-1-ansuelsmth@gmail.com>
References: <20250929113806.2484-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043824_853265_A2E8E5A3 
X-CRM114-Status: GOOD (  20.30  )
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

Add support for the second PCIe Root Complex present on Airoha AN7583
SoC.

This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
also require workaround for the reset signals.

Introduce a new flag to skip having to reset signals and also introduce
some additional logic to configure the PBUS registers required for
Airoha SoC.

While at it, also add additional info on the PERST# Signal delay
comments and use dedicated macro.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 92 ++++++++++++++++++++------
 1 file changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 1678461e56d3..3340c005da4b 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -148,6 +148,7 @@ enum mtk_pcie_flags {
 	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
 			  * external block
 			  */
+	SKIP_PCIE_RSTB	= BIT(3), /* Skip calling RSTB bits on PCIe probe */
 };
 
 /**
@@ -684,28 +685,32 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
+	if (!(soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert all reset signals */
+		writel(0, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Enable PCIe link down reset, if link status changed from
+		 * link up to link down, this will reset MAC control registers
+		 * and configuration space.
+		 */
+		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+
+		/*
+		 * Described in PCIe CEM specification revision 3.0 sections
+		 * 2.2 (PERST# Signal) and 2.2.1 (Initial Power-Up (G3 to S0)).
+		 *
+		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+		 * for the power and clock to become stable.
+		 */
+		msleep(PCIE_T_PVPERL_MS);
+
+		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
+		val = readl(port->base + PCIE_RST_CTRL);
+		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+		       PCIE_MAC_SRSTB | PCIE_CRSTB;
+		writel(val, port->base + PCIE_RST_CTRL);
+	}
 
 	/* Set up vendor ID and class code */
 	if (soc->flags & NEED_FIX_CLASS_ID) {
@@ -826,6 +831,41 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 	return 0;
 }
 
+static int mtk_pcie_startup_port_an7583(struct mtk_pcie_port *port)
+{
+	struct mtk_pcie *pcie = port->pcie;
+	struct device *dev = pcie->dev;
+	struct pci_host_bridge *host;
+	struct resource_entry *entry;
+	struct regmap *pbus_regmap;
+	resource_size_t addr;
+	u32 args[2], size;
+
+	/*
+	 * Configure PBus base address and base address mask to allow
+	 * the hw to detect if a given address is accessible on PCIe
+	 * controller.
+	 */
+	pbus_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+							   "mediatek,pbus-csr",
+							   ARRAY_SIZE(args),
+							   args);
+	if (IS_ERR(pbus_regmap))
+		return PTR_ERR(pbus_regmap);
+
+	host = pci_host_bridge_from_priv(pcie);
+	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
+	if (!entry)
+		return -ENODEV;
+
+	addr = entry->res->start - entry->offset;
+	regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
+	size = lower_32_bits(resource_size(entry->res));
+	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
+
+	return mtk_pcie_startup_port_v2(port);
+}
+
 static void mtk_pcie_enable_port(struct mtk_pcie_port *port)
 {
 	struct mtk_pcie *pcie = port->pcie;
@@ -1210,6 +1250,13 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
 	.flags = NEED_FIX_CLASS_ID,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_an7583,
+	.setup_irq = mtk_pcie_setup_irq,
+	.flags = NEED_FIX_CLASS_ID | SKIP_PCIE_RSTB,
+};
+
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
 	.ops = &mtk_pcie_ops_v2,
@@ -1219,6 +1266,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0


