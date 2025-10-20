Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E8CCD199
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Oct 2025 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPXQlJHmF4oh6NBrps4WHzY7MPHl2PKqTkZLsKWcZ4A=; b=HCpsgmv4RYH2H94m2ZGXW4gphT
	CBg+5BXgYQqAyja2QEvpRR5PpdjAD79xvZN19deevMNf7euvdjDSbpHiPCezrCfTflxKojdRrVkik
	NpDdK0GoB9qidymjkdsM8SbKdHAXRrzU80lvPeN6g9wNiHWvRDKeDosCqxkIFZpxiSbI20BdYgo3u
	W68rzdM6O5Z4p2iAD/+aNueglFxtOvyjP/yxegZZoE2P/8DHN6KlOOt08AY4j/JN18PAUpiQgwBHc
	N4fn+CCEx2kojVie7ySjCA/Oczz3H1WmJY/BUs4vYzY+nIcNBwNRN5gNyf/27BKIF6oSoKCnSnKDP
	ZZIO1YYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnt-0000000D186-0Yzm;
	Mon, 20 Oct 2025 11:11:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnn-0000000D10r-3HyH
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Oct 2025 11:11:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-426ff694c1fso3327681f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Oct 2025 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958706; x=1761563506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPXQlJHmF4oh6NBrps4WHzY7MPHl2PKqTkZLsKWcZ4A=;
        b=BiDpw+tsjFUFnBLDFFx+kMt4Ee5KYnb+6vPv5W6w8Am8VHX2YqIMbTJFmEw6QmWetP
         KPIIf0eIdygjQR+bYxSy76RMyGiOOMo3o1TShJN9kAuuzdMTVcFRGEzAZ1PkkVFMu6kQ
         h6wea9JRM1/A6LgCqn2CGaqTMiEk7XC43sRncjcpNYXrd78Kr782W7vsCvgUFe2ypdgM
         vdP4lItuJ0W14AYKIc7lLpVbO6ROCYq6tusAHGLUFA9rQNxlxZ9xWCQ284lsP6F5o6eC
         moKEEv4GPmxSZhiwMYdaYGSc5o2+f2ox6J3zGHu8QG301YJe1PpaFRE9nwDoncn6h17v
         Utaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958706; x=1761563506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPXQlJHmF4oh6NBrps4WHzY7MPHl2PKqTkZLsKWcZ4A=;
        b=TKffst0/YIow0ov2+1yeG2fZwIZIweUEw4rwK8ENs+xxGcChjEYGEKLbORTq4br+Ln
         KCjXpjc3zJZwkmyVvXeN49TD3UmaMx0NfOcOSZilkUCSz78YRjIfVeHQoZNknja7OeLu
         GwJuhRcm890h/8dPjYcX+swJb6fp80g76ZErUWuBcMSn3eSnNfudoHC3ea59aUg1qpbd
         cV92d64rrNN00DKXU4dVcVfn5zwsNme2Kxwrno3cwgf4Z39vm4ZYX0VyNQF4OA2vHsze
         N4tYBTNjlGpiNDVTd4FUzHLWZYOXLyU3Hbjy29d0UEYqWKQAqdODSSkhQwUaqK9lcpKb
         WQoA==
X-Forwarded-Encrypted: i=1; AJvYcCVTSB+JEBe+tAczMIw1zd0w/m3zppJx9jgFOIm4B7MibFpWXCRKWMBWSxLOy7cvoLw8fLpHIgW1gMzlV02mVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YypO8jX4QBSvV/ZbwMhvxkzZu1XSVDD/PPTnFs4oxI3vquoeMe/
	8PTsqvAFScdrHbNNi9j8L0tb5lR9XftfUxe8rTufVll56/8zY7YxKBgV
X-Gm-Gg: ASbGnctl7fYJhffLC2+mNCe9OIvmzdR7D9ISiwYvn/GHOgh0mPBtJVwZQNWlIn0o3Fz
	VmMHjmRm6pIlZ9KzQaa3koaNjmg/SZ/D5JUhL5ifoFnubMTa50QZlAjVqDo9DkQGtMSC/pnjqkI
	MNgxPdoGmVoScnhDppE08FEG3PZtwMHXyU5TaujZKQivo95ZtMQn2c4vszlc1SXD/xP+w+Yj/Zr
	bPLTHLSBS2nDGRU6DSO4upFN9BrvCxoGtDaRWiGrp8nj2m/fFQR4/qyzVv3l3LdE5Dpg/EfqsQ8
	Pu0e4Nxwd7au+g5aahKYGlLiCRLrRZUd218W+NWQqHftG8kKOWDeoJjl8hKBS+Ngl3zZDWp1QNS
	81Gg0t8xkqcWz3AW9aFJ7Igrleatxfy9UXoQCZS3kXDqb6H8DBHPCe5hCOxNUsf+msrkv6rSTdf
	qym2mCNQHUQO5vCRAHcCI5JhQtXFh4y6mr
X-Google-Smtp-Source: AGHT+IFBsfG4mDpuxI4J6L+KtUyhOVfV2XO1Jy56tSGTqhQz+pjBeuHuXsCZpnVJzTfM6p4J9vjM2Q==
X-Received: by 2002:a05:6000:2911:b0:426:da92:d390 with SMTP id ffacd0b85a97d-42704d83ce7mr8733199f8f.10.1760958705757;
        Mon, 20 Oct 2025 04:11:45 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm12692219f8f.10.2025.10.20.04.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:11:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v6 5/5] PCI: mediatek: Add support for Airoha AN7583 SoC
Date: Mon, 20 Oct 2025 13:11:09 +0200
Message-ID: <20251020111121.31779-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020111121.31779-1-ansuelsmth@gmail.com>
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041147_852426_30BCE005 
X-CRM114-Status: GOOD (  19.86  )
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

Introduce a new quirk to skip having to reset signals and also introduce
some additional logic to configure the PBUS registers required for
Airoha SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 75 +++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 313da61a0b8a..4b78b6528f9f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -147,11 +147,13 @@ struct mtk_pcie_port;
  * @MTK_PCIE_FIX_CLASS_ID: host's class ID needed to be fixed
  * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
  * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
+ * @MTK_PCIE_SKIP_RSTB: Skip calling RSTB bits on PCIe probe
  */
 enum mtk_pcie_quirks {
 	MTK_PCIE_FIX_CLASS_ID = BIT(0),
 	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
 	MTK_PCIE_NO_MSI = BIT(2),
+	MTK_PCIE_SKIP_RSTB = BIT(3),
 };
 
 /**
@@ -687,23 +689,25 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
 	}
 
-	/* Assert all reset signals */
-	writel(0, port->base + PCIE_RST_CTRL);
+	if (!(soc->quirks & MTK_PCIE_SKIP_RSTB)) {
+		/* Assert all reset signals */
+		writel(0, port->base + PCIE_RST_CTRL);
 
-	/*
-	 * Enable PCIe link down reset, if link status changed from link up to
-	 * link down, this will reset MAC control registers and configuration
-	 * space.
-	 */
-	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
+		/*
+		 * Enable PCIe link down reset, if link status changed from
+		 * link up to link down, this will reset MAC control registers
+		 * and configuration space.
+		 */
+		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
 
-	msleep(PCIE_T_PVPERL_MS);
+		msleep(PCIE_T_PVPERL_MS);
 
-	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
-	val = readl(port->base + PCIE_RST_CTRL);
-	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
-	       PCIE_MAC_SRSTB | PCIE_CRSTB;
-	writel(val, port->base + PCIE_RST_CTRL);
+		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
+		val = readl(port->base + PCIE_RST_CTRL);
+		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
+		       PCIE_MAC_SRSTB | PCIE_CRSTB;
+		writel(val, port->base + PCIE_RST_CTRL);
+	}
 
 	/* Set up vendor ID and class code */
 	if (soc->quirks & MTK_PCIE_FIX_CLASS_ID) {
@@ -824,6 +828,41 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
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
@@ -1208,6 +1247,13 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
 	.quirks = MTK_PCIE_FIX_CLASS_ID,
 };
 
+static const struct mtk_pcie_soc mtk_pcie_soc_an7583 = {
+	.ops = &mtk_pcie_ops_v2,
+	.startup = mtk_pcie_startup_port_an7583,
+	.setup_irq = mtk_pcie_setup_irq,
+	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_SKIP_RSTB,
+};
+
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
 	.ops = &mtk_pcie_ops_v2,
@@ -1217,6 +1263,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
+	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
-- 
2.51.0


