Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224F2C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:31:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D2320787
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T5mNsPqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D2320787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jrlm1hX3qlN2rOuUMYeratpdr/QEIILxeXEKSWnh878=; b=T5mNsPqWDasuF/MqHUBKLF2TH
	LeV8lPydaqzE7c7mljEAFlIObGIEmDTp4LsO3yzoGDEOCb72nrwqsjr6oahXdDqrqX8ERu6yng28Q
	2nw9dUl0lUDxLFIa3LGEvjJFgVduEHBNm/wmauPAs0qB/7gJlNgJRyUyLGIA0/b8NOkHXiSJkBMHi
	vrRgyiICLMfL9YSkDztKAuz0Zz1YmvJk05wyJk9ZyGnGEkbRbeTgy5rPVXJVgxjadRLmCDLoIFZvz
	n0i6c33PbxOwriG4SJgoQUpNI59BCyTuTTMQRN+YkbxsCtI0jXkXPkotIOZCznYs1NAleyDEf3AMd
	kQmhKs2QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4Ww-0006mE-Mm; Wed, 22 Jul 2020 02:30:50 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Sf-00045l-UF; Wed, 22 Jul 2020 02:26:27 +0000
Received: by mail-io1-f65.google.com with SMTP id t131so881549iod.3;
 Tue, 21 Jul 2020 19:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MjXJ6fIOA0hWwkWnvR4E9QVRqSuFiK7w+lQm1TOUAs4=;
 b=rh7O81aXeM3lV7FbP+1QWg0lstNVdhTAoSzR/zJoGaapjGdx92pQs5PItE3of2Ey/6
 x6ir0WlIQVvZJhhcj8umJs5H+nwsIou2qA5+ENk7DBaTy7GG9J8a1kR3cFXoVFh1Z48C
 GKfHwk6flbUPBHmRylaOM2P4/IxHm/y0mIPvm9N3iUCEARvmGAqNqgPc22XXDCb/52dl
 RMbV2N3g2SDaEOKJvdasDFZlq7uffqgFoXIeUxAEaajIcZa4Jxl3po9eWHyJzbJ5yOx+
 mxYboH9nwd7lAq1qA6fpVrnmO5lWVuAhnmC2nPpe9XZQEqK80wifjhWBG45Ab329bR0p
 DI1w==
X-Gm-Message-State: AOAM532JOmYpOzBwshyBfrEDWdgNuMyeoAIMDvP5vv2uqGJpHFmcGWYE
 +hem8POHLXSN93wkX8o3YA==
X-Google-Smtp-Source: ABdhPJxLVNxxToXjZnOX0aWGihYvRXBZbwCCli9fJZLB/9afYpxArFCD+Urz+0KH7F87L91RfJsWWA==
X-Received: by 2002:a92:cece:: with SMTP id z14mr29963205ilq.120.1595384784797; 
 Tue, 21 Jul 2020 19:26:24 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 19/19] PCI: Set bridge map_irq and swizzle_irq to default
 functions
Date: Tue, 21 Jul 2020 20:25:14 -0600
Message-Id: <20200722022514.1283916-20-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222626_191613_B5AD0460 
X-CRM114-Status: GOOD (  15.97  )
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

The majority of DT based host drivers use the default .map_irq() and
.swizzle_irq() functions, so let's initialize the function pointers to
the default and drop setting them in the host drivers.

Drivers like iProc which don't support legacy interrupts need to set
.map_irq() back to NULL.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c   | 2 --
 drivers/pci/controller/dwc/pcie-designware-host.c    | 2 --
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 2 --
 drivers/pci/controller/pci-aardvark.c                | 2 --
 drivers/pci/controller/pci-ftpci100.c                | 2 --
 drivers/pci/controller/pci-host-common.c             | 2 --
 drivers/pci/controller/pci-mvebu.c                   | 2 --
 drivers/pci/controller/pci-tegra.c                   | 1 -
 drivers/pci/controller/pci-v3-semi.c                 | 2 --
 drivers/pci/controller/pci-versatile.c               | 2 --
 drivers/pci/controller/pci-xgene.c                   | 2 --
 drivers/pci/controller/pcie-altera.c                 | 2 --
 drivers/pci/controller/pcie-brcmstb.c                | 2 --
 drivers/pci/controller/pcie-iproc-platform.c         | 3 ++-
 drivers/pci/controller/pcie-iproc.c                  | 1 -
 drivers/pci/controller/pcie-mediatek.c               | 2 --
 drivers/pci/controller/pcie-rcar-host.c              | 2 --
 drivers/pci/controller/pcie-rockchip-host.c          | 2 --
 drivers/pci/controller/pcie-xilinx-nwl.c             | 2 --
 drivers/pci/controller/pcie-xilinx.c                 | 2 --
 drivers/pci/of.c                                     | 3 +++
 21 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 4fe39b6b4749..0acd95b7329a 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -234,8 +234,6 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 		goto err_init;
 
 	bridge->ops = &cdns_pcie_host_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	ret = pci_host_probe(bridge);
 	if (ret < 0)
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index d3d4c1e42868..d49db7d2d29a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -467,8 +467,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	bridge->sysdata = pp;
 	bridge->ops = &dw_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	ret = pci_scan_root_bus_bridge(bridge);
 	if (ret)
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index 2954d6ad8333..33ab36d73906 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -596,8 +596,6 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie)
 	/* Initialize bridge */
 	bridge->sysdata = pcie;
 	bridge->ops = &mobiveil_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	ret = mobiveil_bringup_link(pcie);
 	if (ret) {
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index a4a799f52cdb..37c2e49a0408 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1177,8 +1177,6 @@ static int advk_pcie_probe(struct platform_device *pdev)
 
 	bridge->sysdata = pcie;
 	bridge->ops = &advk_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	ret = pci_host_probe(bridge);
 	if (ret < 0) {
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index b1521f4f4096..dc9c25c11faa 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -438,8 +438,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->ops = &faraday_pci_ops;
-	host->map_irq = of_irq_parse_and_map_pci;
-	host->swizzle_irq = pci_common_swizzle;
 	p = pci_host_bridge_priv(host);
 	host->sysdata = p;
 	p->dev = dev;
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index 509624175260..6ce34a1deecb 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -77,8 +77,6 @@ int pci_host_common_probe(struct platform_device *pdev)
 
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	platform_set_drvdata(pdev, bridge);
 
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index db93823a2dcb..12d30fb6ae6e 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1118,8 +1118,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 
 	bridge->sysdata = pcie;
 	bridge->ops = &mvebu_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 	bridge->align_resource = mvebu_pcie_align_resource;
 	bridge->msi = pcie->msi;
 
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index fc4e38fec928..97433beff6cf 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2709,7 +2709,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 
 	host->ops = &tegra_pcie_ops;
 	host->map_irq = tegra_pcie_map_irq;
-	host->swizzle_irq = pci_common_swizzle;
 
 	err = pci_host_probe(host);
 	if (err < 0) {
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index 1a2cbc56b34b..a38a416bcf3b 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -722,8 +722,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->ops = &v3_pci_ops;
-	host->map_irq = of_irq_parse_and_map_pci;
-	host->swizzle_irq = pci_common_swizzle;
 	v3 = pci_host_bridge_priv(host);
 	host->sysdata = v3;
 	v3->dev = dev;
diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index 54a7a43d036a..c79c52556e95 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -151,8 +151,6 @@ static int versatile_pci_probe(struct platform_device *pdev)
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
 	bridge->ops = &pci_versatile_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	return pci_host_probe(bridge);
 }
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 7f5a6595af0a..c33b385ac918 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -621,8 +621,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	bridge->sysdata = port;
 	bridge->ops = &xgene_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	return pci_host_probe(bridge);
 }
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 4b515329ad35..3bacfdb357d2 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -812,8 +812,6 @@ static int altera_pcie_probe(struct platform_device *pdev)
 	bridge->sysdata = pcie;
 	bridge->busnr = pcie->root_bus_nr;
 	bridge->ops = &altera_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	return pci_host_probe(bridge);
 }
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index b24651fad199..6b57551549e6 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -993,8 +993,6 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 
 	bridge->ops = &brcm_pcie_ops;
 	bridge->sysdata = pcie;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	platform_set_drvdata(pdev, pcie);
 
diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index 7c10c1cb6f65..a956b0c18bd1 100644
--- a/drivers/pci/controller/pcie-iproc-platform.c
+++ b/drivers/pci/controller/pcie-iproc-platform.c
@@ -99,9 +99,10 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
 	switch (pcie->type) {
 	case IPROC_PCIE_PAXC:
 	case IPROC_PCIE_PAXC_V2:
+		pcie->map_irq = 0;
 		break;
 	default:
-		pcie->map_irq = of_irq_parse_and_map_pci;
+		break;
 	}
 
 	ret = iproc_pcie_setup(pcie, &bridge->windows);
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index e98dafd0fff4..905e93808243 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1526,7 +1526,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
 	host->ops = &iproc_pcie_ops;
 	host->sysdata = pcie;
 	host->map_irq = pcie->map_irq;
-	host->swizzle_irq = pci_common_swizzle;
 
 	ret = pci_host_probe(host);
 	if (ret < 0) {
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index ca12b2d6892b..4565affe1a2c 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1085,8 +1085,6 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 		return err;
 
 	host->ops = pcie->soc->ops;
-	host->map_irq = of_irq_parse_and_map_pci;
-	host->swizzle_irq = pci_common_swizzle;
 	host->sysdata = pcie;
 
 	err = pci_host_probe(host);
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 67f2a9d3bc29..f6f41db31d47 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -294,8 +294,6 @@ static int rcar_pcie_enable(struct rcar_pcie_host *host)
 
 	bridge->sysdata = host;
 	bridge->ops = &rcar_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		bridge->msi = &host->msi.chip;
 
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index fed4f6cd1b7b..153bc95ab29f 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -1001,8 +1001,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 
 	bridge->sysdata = rockchip;
 	bridge->ops = &rockchip_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	err = pci_host_probe(bridge);
 	if (err < 0)
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 7e7c23c555c7..97305bfe81b5 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -846,8 +846,6 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 
 	bridge->sysdata = pcie;
 	bridge->ops = &nwl_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 	if (IS_ENABLED(CONFIG_PCI_MSI)) {
 		err = nwl_pcie_enable_msi(pcie);
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index f8b8ccea5cbc..8523be61bba5 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -643,8 +643,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 
 	bridge->sysdata = port;
 	bridge->ops = &xilinx_pcie_ops;
-	bridge->map_irq = of_irq_parse_and_map_pci;
-	bridge->swizzle_irq = pci_common_swizzle;
 
 #ifdef CONFIG_PCI_MSI
 	xilinx_pcie_msi_chip.dev = dev;
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 5e06aae1b4cd..8f478d923196 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -569,6 +569,9 @@ int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge)
 	if (!dev->of_node)
 		return 0;
 
+	bridge->swizzle_irq = pci_common_swizzle;
+	bridge->map_irq = of_irq_parse_and_map_pci;
+
 	return pci_parse_request_of_pci_ranges(dev, bridge);
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
