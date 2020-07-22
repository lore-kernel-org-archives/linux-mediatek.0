Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC177C433FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E40207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jOo34d0o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E40207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cqMfJ6fXeywb41UPzrfJgwS8K+Okly9YZ60PLZdRqsc=; b=jOo34d0oc8R5dO+jyjrDJBydt
	D8CQ9hdV1c3Uq2VLhda9qZ7onRGoe1drzIxHarBQpIf43LY8nkWMz9tylFr/f115cP/LVydaSxtLH
	G3MATnjcgwbAMxrC8nyByq8UINXZTLTL+wB5DbL6wVDqjjJVVS6nLkVvrDgvQ0UOW9JGtf6MPdqUh
	Arkmrw1eZSo/sJlZ454U8+J/rHI8yBUIzBXiRfc+oVOL8Gs410MvVNUNcd0QYHyOZWK+dNswWKQun
	d48AzEGFTJv8voVL3iGC/MZUX2vRS+1oj8fjFJ81pI8OgjDmlJjL/S2/9Q0N9PDrm1Gv7dH0cPlZI
	5jsKos4AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4Ru-0003iO-Ry; Wed, 22 Jul 2020 02:25:38 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Ri-0003dk-VO; Wed, 22 Jul 2020 02:25:28 +0000
Received: by mail-io1-f67.google.com with SMTP id v6so878105iob.4;
 Tue, 21 Jul 2020 19:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TMXvwsm1zGNuetsE1xLd6MOXaHwJMUZvuF7GfGDTt3s=;
 b=QSPdV3vmuPdUWXYhsBbw6wzS+crGjcJIC3abnSeWPrNI8PyeHdgJ2oIViLkWJSA+/p
 MNpSNSlEDmyjUU6n5eyB2i37HPmDUum9PxFWhM+t8qyQtvt5rPr8RhHo9y99fMq+ajYU
 UFq6Ppf2Ek1FIFeqsZEnmRfoT+ZeGu/yfYyTL+1cQqaD1M987p7FUu6xaKcp67BQQZmp
 ABVJiq/M/7l6gpll2TIWePeUY1Vjj6amy3LaWUNTWSUOpZppkI93eAIBctZwFHXFfTY0
 sG/i5qd8kbXOXA/R5d+ODo/z3vvPPcx1A411gCYcbRrcWyM9oxVGIIfNaDbMlEDijw4p
 S6jA==
X-Gm-Message-State: AOAM5302nDrhwEBuPZpi4BX2XX+K3RiEIZPtVapyf5rRTUCIknqoj7K9
 ynatEnahXA9shibDYBi1ug==
X-Google-Smtp-Source: ABdhPJwWb30hbuDE3SwJTw0rR4pd1bpy7tXT4fa6QFOD+Na0txFE6AEJUq8tYfrq5DrDtYuovJrSzg==
X-Received: by 2002:a92:cece:: with SMTP id z14mr29960512ilq.120.1595384726103; 
 Tue, 21 Jul 2020 19:25:26 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 02/19] PCI: Set default bridge parent device
Date: Tue, 21 Jul 2020 20:24:57 -0600
Message-Id: <20200722022514.1283916-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222527_212740_E62B9FF2 
X-CRM114-Status: GOOD (  14.51  )
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

The host bridge's parent device is always the platform device. As we
already have a pointer to it in the devres functions, let's initialize
the parent device. Drivers can still override the parent if desired.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c   | 1 -
 drivers/pci/controller/dwc/pcie-designware-host.c    | 1 -
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 1 -
 drivers/pci/controller/pci-aardvark.c                | 1 -
 drivers/pci/controller/pci-ftpci100.c                | 1 -
 drivers/pci/controller/pci-host-common.c             | 1 -
 drivers/pci/controller/pci-loongson.c                | 1 -
 drivers/pci/controller/pci-mvebu.c                   | 1 -
 drivers/pci/controller/pci-tegra.c                   | 1 -
 drivers/pci/controller/pci-v3-semi.c                 | 1 -
 drivers/pci/controller/pci-versatile.c               | 1 -
 drivers/pci/controller/pci-xgene.c                   | 1 -
 drivers/pci/controller/pcie-altera.c                 | 1 -
 drivers/pci/controller/pcie-brcmstb.c                | 1 -
 drivers/pci/controller/pcie-iproc.c                  | 1 -
 drivers/pci/controller/pcie-mediatek.c               | 1 -
 drivers/pci/controller/pcie-rcar-host.c              | 2 --
 drivers/pci/controller/pcie-rockchip-host.c          | 1 -
 drivers/pci/controller/pcie-xilinx-nwl.c             | 1 -
 drivers/pci/controller/pcie-xilinx.c                 | 1 -
 drivers/pci/probe.c                                  | 2 ++
 21 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 9f77e47983c3..84aaf8834e11 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -244,7 +244,6 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	if (ret)
 		goto err_init;
 
-	bridge->dev.parent = dev;
 	bridge->busnr = pcie->bus;
 	bridge->ops = &cdns_pcie_host_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0a4a5aa6fe46..4a16306cec25 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -475,7 +475,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	pp->root_bus_nr = pp->busn->start;
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pp;
 	bridge->busnr = pp->root_bus_nr;
 	bridge->ops = &dw_pcie_ops;
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index 5974619811ec..705542b4bd21 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -605,7 +605,6 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie)
 	}
 
 	/* Initialize bridge */
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = rp->root_bus_nr;
 	bridge->ops = &mobiveil_pcie_ops;
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 90ff291c24f0..8210bf88734b 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1184,7 +1184,6 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = 0;
 	bridge->ops = &advk_pcie_ops;
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index 1b67564de7af..5037aa9f6fd8 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -437,7 +437,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
-	host->dev.parent = dev;
 	host->ops = &faraday_pci_ops;
 	host->busnr = 0;
 	host->msi = NULL;
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index b76e55f495e4..ad395d7feddc 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -76,7 +76,6 @@ int pci_host_common_probe(struct platform_device *pdev)
 	if (!pci_has_flag(PCI_PROBE_ONLY))
 		pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = cfg;
 	bridge->busnr = cfg->busr.start;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
diff --git a/drivers/pci/controller/pci-loongson.c b/drivers/pci/controller/pci-loongson.c
index 459009c8a4a0..0198c15ed97c 100644
--- a/drivers/pci/controller/pci-loongson.c
+++ b/drivers/pci/controller/pci-loongson.c
@@ -225,7 +225,6 @@ static int loongson_pci_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = priv;
 	bridge->ops = &loongson_pci_ops;
 	bridge->map_irq = loongson_map_irq;
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 801044523a3d..7be6db851614 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1116,7 +1116,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 
 	pcie->nports = i;
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = 0;
 	bridge->ops = &mvebu_pcie_ops;
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 82fb36ed6f52..5f91900c3fa3 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2715,7 +2715,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	}
 
 	host->busnr = bus->start;
-	host->dev.parent = &pdev->dev;
 	host->ops = &tegra_pcie_ops;
 	host->map_irq = tegra_pcie_map_irq;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index 198cf2c6ed92..e8b5e55803b2 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -723,7 +723,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
-	host->dev.parent = dev;
 	host->ops = &v3_pci_ops;
 	host->busnr = 0;
 	host->msi = NULL;
diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index 6e55cc59999b..f32ef8072147 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -155,7 +155,6 @@ static int versatile_pci_probe(struct platform_device *pdev)
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = NULL;
 	bridge->busnr = 0;
 	bridge->ops = &pci_versatile_ops;
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 5aee802946cb..fbb461cf8eca 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -624,7 +624,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = port;
 	bridge->busnr = 0;
 	bridge->ops = &xgene_pcie_ops;
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 26ac3ad81de0..83ee09baf95f 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -816,7 +816,6 @@ static int altera_pcie_probe(struct platform_device *pdev)
 	cra_writel(pcie, P2A_INT_ENA_ALL, P2A_INT_ENABLE);
 	altera_pcie_host_init(pcie);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = pcie->root_bus_nr;
 	bridge->ops = &altera_pcie_ops;
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 15c747c1390a..4291a15abdcf 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -996,7 +996,6 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		}
 	}
 
-	bridge->dev.parent = &pdev->dev;
 	bridge->busnr = 0;
 	bridge->ops = &brcm_pcie_ops;
 	bridge->sysdata = pcie;
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 232fca0754e1..cf1cb717c7df 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1524,7 +1524,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
 			dev_info(dev, "not using iProc MSI\n");
 
 	host->busnr = 0;
-	host->dev.parent = dev;
 	host->ops = &iproc_pcie_ops;
 	host->sysdata = pcie;
 	host->map_irq = pcie->map_irq;
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index ebfa7d5a4e2d..a8710121264f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1097,7 +1097,6 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 		return err;
 
 	host->busnr = pcie->busnr;
-	host->dev.parent = pcie->dev;
 	host->ops = pcie->soc->ops;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 9069ad96fe95..3a8e749b4904 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -329,7 +329,6 @@ static int rcar_pcie_enable(struct rcar_pcie_host *host)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct rcar_pcie *pcie = &host->pcie;
-	struct device *dev = pcie->dev;
 
 	/* Try setting 5 GT/s link speed */
 	rcar_pcie_force_speedup(pcie);
@@ -338,7 +337,6 @@ static int rcar_pcie_enable(struct rcar_pcie_host *host)
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = host;
 	bridge->busnr = host->root_bus_nr;
 	bridge->ops = &rcar_pcie_ops;
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 6a3c8442258b..4eb79c60d627 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -1007,7 +1007,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_remove_irq_domain;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = rockchip;
 	bridge->busnr = 0;
 	bridge->ops = &rockchip_pcie_ops;
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 32a0b08d6da5..3c747aa4b6d1 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -854,7 +854,6 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = pcie->root_busno;
 	bridge->ops = &nwl_pcie_ops;
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 05547497f391..7c0f3268fc5c 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -651,7 +651,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = port;
 	bridge->busnr = 0;
 	bridge->ops = &xilinx_pcie_ops;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..5583037dbdfa 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -628,6 +628,8 @@ struct pci_host_bridge *devm_pci_alloc_host_bridge(struct device *dev,
 	if (!bridge)
 		return NULL;
 
+	bridge->dev.parent = dev;
+
 	ret = devm_add_action_or_reset(dev, devm_pci_alloc_host_bridge_release,
 				       bridge);
 	if (ret)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
