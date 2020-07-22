Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED399C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC38020787
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a/sDHC75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC38020787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fI0qDMOIZHtF6XC3ZTjEDp8RTUoY2iTWciFcZkU+q14=; b=a/sDHC75ak0WmXHA0+FzdNrek
	k8j7eEW/3KJOWA0ygH+GU8lx6NXz9CxcePfHNDx+D+Y2XBM1gu9ueS2Hmd3ALK81uEEaIEOvzGmQH
	2BuxxZ+o72RfjYYFPXGleiesUKcbhBAWCSuvvondaiIN3xDIjtsqxg6MMGQAQYFVNqoY8KO2lT0Ri
	1893GBl6X75nrvYplqgRrbr3URfCz18PhCfb0wI7EMUK2+OBX8RsrDBtIEkGSDins72CjR2a0Qcd6
	MAveuhnwP5o77oVhqgyCtK+TTUPom5OjP5fm++BGxxSaYguht4tSPcxIIb7xsWkyfz4s+VxFNR+nT
	eGGg9KcfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4WR-0006QV-0v; Wed, 22 Jul 2020 02:30:19 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SY-00041j-Ah; Wed, 22 Jul 2020 02:26:19 +0000
Received: by mail-io1-f65.google.com with SMTP id a12so833945ion.13;
 Tue, 21 Jul 2020 19:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nA+rsQKPRqCqRLcwD1sS32YGd+tZlaV9KVJ00B242z0=;
 b=TUyuMHF2bQkD5Oiyny6Rp/m6LK1zyo91qsHgvoUxnW6xjT3OLGuz2eYPDKc5sIe4y+
 HBwYYmoJKsoWq0Rrn/gomCdwyFRB2AnxQDHsx0lEnY33DG4FzKCWbFFxjX2ZTGljDz9s
 C339jNM9rOIr0uwMCaR3GJXNMveaLI1ov1x8Ag7ITXjMHo0Bv8JtwPyfwsBPrjpZ2Keo
 6fo9mQWEogGWQ17b3FCiGOnQQkp5Ikp6NujAbFSDKJrLLSyFs/1bYWMXHH+m1iFYMASA
 ycQOcO7Vf2SM56seMgFi3LCzEGg/t9Wj4QtyPOnWj03qWFMv63srlvgKTIWJaEasTP/h
 VilA==
X-Gm-Message-State: AOAM53317j6qPYVFpthAlkkt+xcg7hcNMDA8JI79wVQ1Tzt+IY1SXLS6
 SYqcD2tCFh7o4p3efso5+g==
X-Google-Smtp-Source: ABdhPJxSNucNP4OWBpa9UcK7As8QwrrkPn4QAty5DF1RSC4aIpj+DE8hJm33Ytw1h98hgyWUYp5/ow==
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr30809085ioj.148.1595384777729; 
 Tue, 21 Jul 2020 19:26:17 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 17/19] PCI: rcar-gen2: Convert to use modern host bridge probe
 functions
Date: Tue, 21 Jul 2020 20:25:12 -0600
Message-Id: <20200722022514.1283916-18-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222618_692479_8881F832 
X-CRM114-Status: GOOD (  23.64  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The rcar-gen2 host driver still uses the old Arm PCI setup function
pci_common_init_dev(). Let's update it to use the modern
devm_pci_alloc_host_bridge(), pci_parse_request_of_pci_ranges() and
pci_host_probe() functions.

Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-rcar-gen2.c | 168 +++++++------------------
 1 file changed, 46 insertions(+), 122 deletions(-)

diff --git a/drivers/pci/controller/pci-rcar-gen2.c b/drivers/pci/controller/pci-rcar-gen2.c
index 326171cb1a97..5b9888d4c34a 100644
--- a/drivers/pci/controller/pci-rcar-gen2.c
+++ b/drivers/pci/controller/pci-rcar-gen2.c
@@ -98,22 +98,17 @@ struct rcar_pci_priv {
 	void __iomem *reg;
 	struct resource mem_res;
 	struct resource *cfg_res;
-	unsigned busnr;
 	int irq;
-	unsigned long window_size;
-	unsigned long window_addr;
-	unsigned long window_pci;
 };
 
 /* PCI configuration space operations */
 static void __iomem *rcar_pci_cfg_base(struct pci_bus *bus, unsigned int devfn,
 				       int where)
 {
-	struct pci_sys_data *sys = bus->sysdata;
-	struct rcar_pci_priv *priv = sys->private_data;
+	struct rcar_pci_priv *priv = bus->sysdata;
 	int slot, val;
 
-	if (sys->busnr != bus->number || PCI_FUNC(devfn))
+	if (!pci_is_root_bus(bus) || PCI_FUNC(devfn))
 		return NULL;
 
 	/* Only one EHCI/OHCI device built-in */
@@ -132,20 +127,6 @@ static void __iomem *rcar_pci_cfg_base(struct pci_bus *bus, unsigned int devfn,
 	return priv->reg + (slot >> 1) * 0x100 + where;
 }
 
-/* PCI interrupt mapping */
-static int rcar_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	struct pci_sys_data *sys = dev->bus->sysdata;
-	struct rcar_pci_priv *priv = sys->private_data;
-	int irq;
-
-	irq = of_irq_parse_and_map_pci(dev, slot, pin);
-	if (!irq)
-		irq = priv->irq;
-
-	return irq;
-}
-
 #ifdef CONFIG_PCI_DEBUG
 /* if debug enabled, then attach an error handler irq to the bridge */
 
@@ -189,19 +170,33 @@ static inline void rcar_pci_setup_errirq(struct rcar_pci_priv *priv) { }
 #endif
 
 /* PCI host controller setup */
-static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
+static void rcar_pci_setup(struct rcar_pci_priv *priv)
 {
-	struct rcar_pci_priv *priv = sys->private_data;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(priv);
 	struct device *dev = priv->dev;
 	void __iomem *reg = priv->reg;
+	struct resource_entry *entry;
+	unsigned long window_size;
+	unsigned long window_addr;
+	unsigned long window_pci;
 	u32 val;
-	int ret;
+
+	entry = resource_list_first_type(&bridge->dma_ranges, IORESOURCE_MEM);
+	if (!entry) {
+		window_addr = 0x40000000;
+		window_pci = 0x40000000;
+		window_size = SZ_1G;
+	} else {
+		window_addr = entry->res->start;
+		window_pci = entry->res->start - entry->offset;
+		window_size = resource_size(entry->res);
+	}
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
 	val = ioread32(reg + RCAR_PCI_UNIT_REV_REG);
-	dev_info(dev, "PCI: bus%u revision %x\n", sys->busnr, val);
+	dev_info(dev, "PCI: revision %x\n", val);
 
 	/* Disable Direct Power Down State and assert reset */
 	val = ioread32(reg + RCAR_USBCTR_REG) & ~RCAR_USBCTR_DIRPD;
@@ -214,7 +209,7 @@ static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
 		 RCAR_USBCTR_USBH_RST | RCAR_USBCTR_PLL_RST);
 
 	/* Setup PCIAHB window1 size */
-	switch (priv->window_size) {
+	switch (window_size) {
 	case SZ_2G:
 		val |= RCAR_USBCTR_PCIAHB_WIN1_2G;
 		break;
@@ -226,8 +221,8 @@ static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
 		break;
 	default:
 		pr_warn("unknown window size %ld - defaulting to 256M\n",
-			priv->window_size);
-		priv->window_size = SZ_256M;
+			window_size);
+		window_size = SZ_256M;
 		/* fall-through */
 	case SZ_256M:
 		val |= RCAR_USBCTR_PCIAHB_WIN1_256M;
@@ -245,7 +240,7 @@ static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
 	iowrite32(val, reg + RCAR_PCI_ARBITER_CTR_REG);
 
 	/* PCI-AHB mapping */
-	iowrite32(priv->window_addr | RCAR_PCIAHB_PREFETCH16,
+	iowrite32(window_addr | RCAR_PCIAHB_PREFETCH16,
 		  reg + RCAR_PCIAHB_WIN1_CTR_REG);
 
 	/* AHB-PCI mapping: OHCI/EHCI registers */
@@ -256,7 +251,7 @@ static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
 	iowrite32(RCAR_AHBPCI_WIN1_HOST | RCAR_AHBPCI_WIN_CTR_CFG,
 		  reg + RCAR_AHBPCI_WIN1_CTR_REG);
 	/* Set PCI-AHB Window1 address */
-	iowrite32(priv->window_pci | PCI_BASE_ADDRESS_MEM_PREFETCH,
+	iowrite32(window_pci | PCI_BASE_ADDRESS_MEM_PREFETCH,
 		  reg + PCI_BASE_ADDRESS_1);
 	/* Set AHB-PCI bridge PCI communication area address */
 	val = priv->cfg_res->start + RCAR_AHBPCI_PCICOM_OFFSET;
@@ -271,18 +266,7 @@ static int rcar_pci_setup(int nr, struct pci_sys_data *sys)
 	iowrite32(RCAR_PCI_INT_A | RCAR_PCI_INT_B | RCAR_PCI_INT_PME,
 		  reg + RCAR_PCI_INT_ENABLE_REG);
 
-	if (priv->irq > 0)
-		rcar_pci_setup_errirq(priv);
-
-	/* Add PCI resources */
-	pci_add_resource(&sys->resources, &priv->mem_res);
-	ret = devm_request_pci_bus_resources(dev, &sys->resources);
-	if (ret < 0)
-		return ret;
-
-	/* Setup bus number based on platform device id / of bus-range */
-	sys->busnr = priv->busnr;
-	return 1;
+	rcar_pci_setup_errirq(priv);
 }
 
 static struct pci_ops rcar_pci_ops = {
@@ -291,55 +275,21 @@ static struct pci_ops rcar_pci_ops = {
 	.write	= pci_generic_config_write,
 };
 
-static int rcar_pci_parse_map_dma_ranges(struct rcar_pci_priv *pci,
-					 struct device_node *np)
-{
-	struct device *dev = pci->dev;
-	struct of_pci_range range;
-	struct of_pci_range_parser parser;
-	int index = 0;
-
-	/* Failure to parse is ok as we fall back to defaults */
-	if (of_pci_dma_range_parser_init(&parser, np))
-		return 0;
-
-	/* Get the dma-ranges from DT */
-	for_each_of_pci_range(&parser, &range) {
-		/* Hardware only allows one inbound 32-bit range */
-		if (index)
-			return -EINVAL;
-
-		pci->window_addr = (unsigned long)range.cpu_addr;
-		pci->window_pci = (unsigned long)range.pci_addr;
-		pci->window_size = (unsigned long)range.size;
-
-		/* Catch HW limitations */
-		if (!(range.flags & IORESOURCE_PREFETCH)) {
-			dev_err(dev, "window must be prefetchable\n");
-			return -EINVAL;
-		}
-		if (pci->window_addr) {
-			u32 lowaddr = 1 << (ffs(pci->window_addr) - 1);
-
-			if (lowaddr < pci->window_size) {
-				dev_err(dev, "invalid window size/addr\n");
-				return -EINVAL;
-			}
-		}
-		index++;
-	}
-
-	return 0;
-}
-
 static int rcar_pci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *cfg_res, *mem_res;
 	struct rcar_pci_priv *priv;
+	struct pci_host_bridge *bridge;
 	void __iomem *reg;
-	struct hw_pci hw;
-	void *hw_private[1];
+	int ret;
+
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*priv));
+	if (!bridge)
+		return -ENOMEM;
+
+	priv = pci_host_bridge_priv(bridge);
+	bridge->sysdata = priv;
 
 	cfg_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg = devm_ioremap_resource(dev, cfg_res);
@@ -369,44 +319,18 @@ static int rcar_pci_probe(struct platform_device *pdev)
 		return priv->irq;
 	}
 
-	/* default window addr and size if not specified in DT */
-	priv->window_addr = 0x40000000;
-	priv->window_pci = 0x40000000;
-	priv->window_size = SZ_1G;
-
-	if (dev->of_node) {
-		struct resource busnr;
-		int ret;
-
-		ret = of_pci_parse_bus_range(dev->of_node, &busnr);
-		if (ret < 0) {
-			dev_err(dev, "failed to parse bus-range\n");
-			return ret;
-		}
-
-		priv->busnr = busnr.start;
-		if (busnr.end != busnr.start)
-			dev_warn(dev, "only one bus number supported\n");
-
-		ret = rcar_pci_parse_map_dma_ranges(priv, dev->of_node);
-		if (ret < 0) {
-			dev_err(dev, "failed to parse dma-range\n");
-			return ret;
-		}
-	} else {
-		priv->busnr = pdev->id;
-	}
+	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
+					      &bridge->dma_ranges, NULL);
+	if (ret)
+		return ret;
+
+	bridge->ops = &rcar_pci_ops;
+
+	pci_add_flags(PCI_REASSIGN_ALL_BUS);
+
+	rcar_pci_setup(priv);
 
-	hw_private[0] = priv;
-	memset(&hw, 0, sizeof(hw));
-	hw.nr_controllers = ARRAY_SIZE(hw_private);
-	hw.io_optional = 1;
-	hw.private_data = hw_private;
-	hw.map_irq = rcar_pci_map_irq;
-	hw.ops = &rcar_pci_ops;
-	hw.setup = rcar_pci_setup;
-	pci_common_init_dev(dev, &hw);
-	return 0;
+	return pci_host_probe(bridge);
 }
 
 static const struct of_device_id rcar_pci_of_match[] = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
