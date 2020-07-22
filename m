Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F6C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603A1207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXhCJn3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603A1207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ngd1LfsT5IhmYFfSHIAyMFjJGlJZNU3S/m8xtCMDeY4=; b=JXhCJn3hXn8ub0Bt/tg+zyU86
	Vgquu2WCEvCAV693qiNk8v/pW5iSO2JjEFhPmf/O7VDAHR//G51T8OKYGeqDp6XRsusXVktohpoNW
	OgSgBIWEoqAEOBGtVhOSrTYiRjBjDy95w0Ax4yPRdDg4Qw/ubcvUKP9cKoh3TQKSpxaqVplt8AIoe
	wzzcen9otKnExkbrMvrn058HCrwOtNp0RKE4Nws/wfNZrhvWB8+gi+6GCB1kMkntZ6QI4FwS/FhDV
	NZCjEle0PGTtA375MzqTr9J8q5ouYbzln7RXYZhSl9m9Af4m9ziP4R2KYyJOPcvO0WCLDzMdfGLjl
	4HpKqWIIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4Vh-0005tE-Hr; Wed, 22 Jul 2020 02:29:33 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SR-0003yX-Nk; Wed, 22 Jul 2020 02:26:12 +0000
Received: by mail-io1-f67.google.com with SMTP id i4so843694iov.11;
 Tue, 21 Jul 2020 19:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RXETcnjipP+8oLeDxXvLlltrH+ttPbWIrHJVUYWNNYw=;
 b=BEu+rYEftRowVnnTRypsnX/+QCHxFwzLr44OqTHq+N7luzLQCDOlQHhes0sWd3L7Da
 PyMc41VIZTjfOlq9IavolojwJTYuTvongdJRtUy+7QM39wKxKenekE6QzdkStk9xpp7z
 HUar+haCKTteyRxoOMteUjavS3dvyhB8DONP4ac1m0Kej90D2HXEKu49xAwYIr4PQab4
 dLuXR+BWoP8QbqrfkSgAnwc/j8cnqQsgEJ4JXHW5puOwdQcgOp04+RVagav+wyHTvkMY
 sPWCnWst+A3gsXB3q5ayLVj4IILxosGcVkLnbkVx+CAawD2YxMllAupAKHeyBMM1QzLQ
 JuOQ==
X-Gm-Message-State: AOAM531qh8irUcmkhGG+jpuBBpGex3wnsTlw/E0RI14KLAk3lzJFnG/c
 10UOyk84yOXTfmRRV2q21A==
X-Google-Smtp-Source: ABdhPJx1PBfbdrTR8EDCpBeiH1ZDyq2MNA+2sxSJnY23nUstn2PPiOrmXIVCkGTujbAUG6lB8THf7w==
X-Received: by 2002:a5d:9b05:: with SMTP id y5mr30801250ion.59.1595384770914; 
 Tue, 21 Jul 2020 19:26:10 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:10 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 15/19] PCI: rcar: Use struct pci_host_bridge.windows list
 directly
Date: Tue, 21 Jul 2020 20:25:10 -0600
Message-Id: <20200722022514.1283916-16-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222611_867510_52087A45 
X-CRM114-Status: GOOD (  14.93  )
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

There's no need to create a temporary resource list and then splice it to
struct pci_host_bridge.windows list. Just use pci_host_bridge.windows
directly. The necessary clean-up is already handled by the PCI core.

Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-rcar-host.c | 45 +++----------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index c470bff5af0f..fa7b89378904 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -53,7 +53,6 @@ struct rcar_pcie_host {
 	struct device		*dev;
 	struct phy		*phy;
 	void __iomem		*base;
-	struct list_head	resources;
 	struct clk		*bus_clk;
 	struct			rcar_msi msi;
 	int			(*phy_init_fn)(struct rcar_pcie_host *host);
@@ -203,38 +202,6 @@ static struct pci_ops rcar_pcie_ops = {
 	.write	= rcar_pcie_write_conf,
 };
 
-static int rcar_pcie_setup(struct list_head *resource,
-			   struct rcar_pcie_host *host)
-{
-	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
-	struct resource_entry *win;
-	int i = 0;
-
-	/* Setup PCI resources */
-	resource_list_for_each_entry(win, &host->resources) {
-		struct resource *res = win->res;
-
-		if (!res->flags)
-			continue;
-
-		switch (resource_type(res)) {
-		case IORESOURCE_IO:
-		case IORESOURCE_MEM:
-			rcar_pcie_set_outbound(&host->pcie, i, win);
-			i++;
-			break;
-		case IORESOURCE_BUS:
-			break;
-		default:
-			continue;
-		}
-
-		pci_add_resource(resource, res);
-	}
-
-	return 1;
-}
-
 static void rcar_pcie_force_speedup(struct rcar_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
@@ -292,6 +259,7 @@ static void rcar_pcie_force_speedup(struct rcar_pcie *pcie)
 static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 {
 	struct rcar_pcie *pcie = &host->pcie;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct resource_entry *win;
 	LIST_HEAD(res);
 	int i = 0;
@@ -300,7 +268,7 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 	rcar_pcie_force_speedup(pcie);
 
 	/* Setup PCI resources */
-	resource_list_for_each_entry(win, &host->resources) {
+	resource_list_for_each_entry(win, &bridge->windows) {
 		struct resource *res = win->res;
 
 		if (!res->flags)
@@ -319,12 +287,8 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 static int rcar_pcie_enable(struct rcar_pcie_host *host)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
-	struct rcar_pcie *pcie = &host->pcie;
 
-	/* Try setting 5 GT/s link speed */
-	rcar_pcie_force_speedup(pcie);
-
-	rcar_pcie_setup(&bridge->windows, host);
+	rcar_pcie_hw_enable(host);
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
@@ -949,7 +913,7 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 	pcie->dev = dev;
 	platform_set_drvdata(pdev, host);
 
-	err = pci_parse_request_of_pci_ranges(dev, &host->resources,
+	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
 					      &bridge->dma_ranges, NULL);
 	if (err)
 		return err;
@@ -1032,7 +996,6 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(dev);
-	pci_free_resource_list(&host->resources);
 
 	return err;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
