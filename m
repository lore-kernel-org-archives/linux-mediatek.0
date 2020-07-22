Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5D9C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D620207D0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olUiZ653"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D620207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2a6LyHvBAxZFV6oRt6BKxsFUokt1Oads1Q7Uwx2igMk=; b=olUiZ653VlEJ8xy+0Wc32niSX
	4TvHOHhvjuZ/jwcFwHAendMQ5pqa++rJssl2DtUd4tPdM0/0fLeo2Ow3O1xy8u5Tv3w1rkearDPoq
	ty5BYUjBfMDVKB2LibQnT9uyS1MXRDPFK3ZKpoWlNNX9CA3GXypzuiykeHR+b+gkwJeVN5HPBap5Z
	kCvnsAYopS24BarkJNrCzAKbJ67nlGmwWCdSePVKzb/4glVVfRArUXbM5OXYTqmr779jBDwiJX0ee
	9mtfs74Pv0JCaJd1Y5q2ngK3UzYwrO9ubt1wf+36xrlUx4583iAr0Jm8Yf1QWBzUL6ShmOcmexoGX
	dIOu05Gog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4Ui-0005Bo-H8; Wed, 22 Jul 2020 02:28:32 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SD-0003qP-4n; Wed, 22 Jul 2020 02:25:59 +0000
Received: by mail-io1-f67.google.com with SMTP id c16so852488ioi.9;
 Tue, 21 Jul 2020 19:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AUGh8RnhEjK8Q/8Ao/CLt6QYVRW9aIR/xlxMXsI6GXQ=;
 b=LCJndjY0fYxj40gly1YUIqFx5ze0aTiCnDrTEMyVkxwDTalARQdrvfm3d7BNuoQyrg
 YiPocrsD7p+VLQWPudbzV9nPafbV6y/Q3cnWobFjCpecURomNn5DkexcqkST0bOYsMes
 e+K1w43V0oA0jnRp6QdP8TQcUyDyKCMxIEYLGU3qgpKDLzL58yYfYUSY4E6oG6aPP8Y7
 3SDJGrdyZV6OjDlT7FLFnbniBoTuThJdXsC1Bj46V73HzQhTvThKevIga/luzOApRGNB
 Ugk8uCMm3bT7q7zJDcYkhGxXdbS060xICkbYPVkHqubf64ZB7mIIdzhtA18OpomyyADW
 gAXw==
X-Gm-Message-State: AOAM532/tVGLtLL9CmB7ULjLcRvXB/gGUc0bPuQFW+5ez5BED8uSgsvU
 BOYHcH4l+cQAmcNDgvlxBw==
X-Google-Smtp-Source: ABdhPJzUZdTE9kOK0eUiRdeQnIfx8Ek0NUZFQenI/g6qWLpgqO4tE2w2ELbhRBGslHj7oW911odtpw==
X-Received: by 2002:a6b:6c09:: with SMTP id a9mr30468818ioh.178.1595384756377; 
 Tue, 21 Jul 2020 19:25:56 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:55 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 11/19] PCI: Move setting pci_host_bridge.busnr out of host
 drivers
Date: Tue, 21 Jul 2020 20:25:06 -0600
Message-Id: <20200722022514.1283916-12-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222557_747788_F81C59AD 
X-CRM114-Status: GOOD (  17.23  )
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

Most host drivers only parse the DT bus range to set the root bus number
in pci_host_bridge.busnr. The ones that don't set busnr are buggy in
that they ignore what's in DT. Let's set busnr in pci_scan_root_bus_bridge()
where we already check for the bus resource and remove setting it in
host drivers.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-tegra@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 4 ----
 drivers/pci/controller/dwc/pcie-designware.h      | 1 -
 drivers/pci/controller/pci-aardvark.c             | 5 ++---
 drivers/pci/controller/pci-host-common.c          | 1 -
 drivers/pci/controller/pci-tegra.c                | 4 +---
 drivers/pci/controller/pci-v3-semi.c              | 2 --
 drivers/pci/controller/pcie-mediatek.c            | 8 +-------
 drivers/pci/controller/pcie-rcar-host.c           | 1 -
 drivers/pci/probe.c                               | 1 +
 9 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9e8a9cfc6d3a..fa922cb876a3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -374,9 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->cfg0_base = pp->cfg->start;
 			pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
 			break;
-		case IORESOURCE_BUS:
-			pp->busn = win->res;
-			break;
 		}
 	}
 
@@ -474,7 +471,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	}
 
 	bridge->sysdata = pp;
-	bridge->busnr = pp->busn->start;
 	bridge->ops = &dw_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index fd2146298b58..9fb44290ed43 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -188,7 +188,6 @@ struct pcie_port {
 	struct resource		*cfg;
 	struct resource		*io;
 	struct resource		*mem;
-	struct resource		*busn;
 	int			irq;
 	const struct dw_pcie_host_ops *ops;
 	int			msi_irq;
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 07d4a75b5c8f..61c59a6935c9 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1104,7 +1104,7 @@ static int advk_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct advk_pcie *pcie;
-	struct resource *res, *bus;
+	struct resource *res;
 	struct pci_host_bridge *bridge;
 	int ret, irq;
 
@@ -1133,12 +1133,11 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	}
 
 	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
-					      &bridge->dma_ranges, &bus);
+					      &bridge->dma_ranges, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to parse resources\n");
 		return ret;
 	}
-	bridge->busnr = bus->start;
 
 	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
 						       "reset-gpios", 0,
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index ad395d7feddc..e662910fe032 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -77,7 +77,6 @@ int pci_host_common_probe(struct platform_device *pdev)
 		pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
 	bridge->sysdata = cfg;
-	bridge->busnr = cfg->busr.start;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 5f91900c3fa3..9c91df9cd2ba 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2670,7 +2670,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pci_host_bridge *host;
 	struct tegra_pcie *pcie;
-	struct resource *bus;
 	int err;
 
 	host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
@@ -2685,7 +2684,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&pcie->ports);
 	pcie->dev = dev;
 
-	err = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL, &bus);
+	err = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL, NULL);
 	if (err) {
 		dev_err(dev, "Getting bridge resources failed\n");
 		return err;
@@ -2714,7 +2713,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 		goto pm_runtime_put;
 	}
 
-	host->busnr = bus->start;
 	host->ops = &tegra_pcie_ops;
 	host->map_irq = tegra_pcie_map_irq;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index d79af39e6e60..d2619f583bfb 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -584,8 +584,6 @@ static int v3_pci_setup_resource(struct v3_pci *v3,
 		}
 		break;
 	case IORESOURCE_BUS:
-		dev_dbg(dev, "BUS %pR\n", win->res);
-		host->busnr = win->res->start;
 		break;
 	default:
 		dev_info(dev, "Unknown resource type %lu\n",
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a8710121264f..acbb656a8092 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -209,7 +209,6 @@ struct mtk_pcie_port {
  * @mem: non-prefetchable memory resource
  * @ports: pointer to PCIe port information
  * @soc: pointer to SoC-dependent operations
- * @busnr: root bus number
  */
 struct mtk_pcie {
 	struct device *dev;
@@ -218,7 +217,6 @@ struct mtk_pcie {
 
 	struct list_head ports;
 	const struct mtk_pcie_soc *soc;
-	unsigned int busnr;
 };
 
 static void mtk_pcie_subsys_powerdown(struct mtk_pcie *pcie)
@@ -1033,16 +1031,13 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
 	struct mtk_pcie_port *port, *tmp;
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
 	struct list_head *windows = &host->windows;
-	struct resource *bus;
 	int err;
 
 	err = pci_parse_request_of_pci_ranges(dev, windows,
-					      &host->dma_ranges, &bus);
+					      &host->dma_ranges, NULL);
 	if (err)
 		return err;
 
-	pcie->busnr = bus->start;
-
 	for_each_available_child_of_node(node, child) {
 		int slot;
 
@@ -1096,7 +1091,6 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	host->busnr = pcie->busnr;
 	host->ops = pcie->soc->ops;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index bf10f1cf04f4..58f4d339eb0c 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -224,7 +224,6 @@ static int rcar_pcie_setup(struct list_head *resource,
 			i++;
 			break;
 		case IORESOURCE_BUS:
-			bridge->busnr = res->start;
 			break;
 		default:
 			continue;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 5583037dbdfa..f850782efc35 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3088,6 +3088,7 @@ int pci_scan_root_bus_bridge(struct pci_host_bridge *bridge)
 
 	resource_list_for_each_entry(window, &bridge->windows)
 		if (window->res->flags & IORESOURCE_BUS) {
+			bridge->busnr = window->res->start;
 			found = true;
 			break;
 		}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
