Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FBCC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:27:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830A1207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vh7tRdWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830A1207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UfZZjXhvIwYHd8Y/TGHRalBF7SvuO2fXqFNC3KPU4e8=; b=vh7tRdWTKtmjr0aRz3m3qqL4v
	JLvgqQPRXnqLkpX+Wd6XIU2nzdVlNyNBgSZbCeX3DRaF4uUPRuJG4RCtNHr63flmYSiUqWj5gOOvF
	irOTWipGobyyD/VbgjgU8M+1NXSklxZ2J0vvnYQfjfxuIcshsd0sfeualMoCd0zwqtNvu02L0Tqs+
	4js5hZQDv43TPBRv3JRi4hu07TMQ2EbmKuWUun37qyPFG8KiSD7AEE6oKFy+uwqNDClh/x9/N4T+y
	qeeqP9Nor3rX+Z3jqO6yVU+9dAwPetR1szNqJ0nqqMyEVNZDCRY+rmhph7eYGHn2qURIWfS8zOaSu
	m9rgJbZDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4T4-0004Gj-6m; Wed, 22 Jul 2020 02:26:50 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Rs-0003hP-18; Wed, 22 Jul 2020 02:25:37 +0000
Received: by mail-io1-f68.google.com with SMTP id k23so840917iom.10;
 Tue, 21 Jul 2020 19:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oM4JjaIhGNUCsF1dxzKGJCBiD9UbSALjkOnB0iODMZ0=;
 b=CLVjhH2HgEXMjKXfumZPvN5ITFCwvxtcqS7vOBwzusxu9NjSKjqq2Z0w+gl1eCkygA
 2K6q9DyT0UOg/ZeGm/T/v8vHjE1s+s8UyQrBQoKAQgRT3/qzzkt3E3qFLRBnEyGRgkWy
 SRak5MipANNutij8Ai2vPi6yq08F5jmXb+mnRlNFYqKfcqy7QfPDYmLmkTrDkKM1Xb6o
 DAumQzl92H9zMUvusS7hKyhznVutHt4DpiS3dStSbGNckcVz8bz/K4zsMp+KdCcGu75X
 dtXGDKXb6O5Bls2jPxrK44T8Ns4zDpDbUAjgZiNOp3QdL6JplAd+mM/+fhhqhiP7lxZL
 w9Qg==
X-Gm-Message-State: AOAM533iT6rccmYgX80erw+tG+yPCEXqy05PgYz4vOhFb8DE0bSfBPPn
 Hb3OnCf+T8D8Xb8+sYccbg==
X-Google-Smtp-Source: ABdhPJyN6+/cwBD//NLJoPanWPRv1QX1UiE0Njw0SkNnxIvIn/rh3ZWXUAQJ+Zy79aKcLX73FfSj/A==
X-Received: by 2002:a92:cf51:: with SMTP id c17mr28985837ilr.122.1595384735554; 
 Tue, 21 Jul 2020 19:25:35 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 05/19] PCI: designware: Use pci_is_root_bus() to check if bus
 is root bus
Date: Tue, 21 Jul 2020 20:25:00 -0600
Message-Id: <20200722022514.1283916-6-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222536_145619_A9E12887 
X-CRM114-Status: GOOD (  18.66  )
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

Use pci_is_root_bus() rather than tracking the root bus number to
determine if the bus is the root bus or not. This removes storing
duplicated data as well as the need for the host bridge driver to have
to care about the bus numbers in most cases.

Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c          |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c      |  4 ++--
 .../pci/controller/dwc/pcie-designware-host.c  | 18 +++++++-----------
 drivers/pci/controller/dwc/pcie-designware.h   |  1 -
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 8f08ae53f53e..9f1e4d9c008b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1269,7 +1269,7 @@ static void imx6_pcie_quirk(struct pci_dev *dev)
 	if (bus->dev.parent->parent->driver != &imx6_pcie_driver.driver)
 		return;
 
-	if (bus->number == pp->root_bus_nr) {
+	if (pci_is_root_bus(bus)) {
 		struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 		struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 790679fdfa48..fcc3586c345b 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -440,7 +440,7 @@ static int ks_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 
 	reg = CFG_BUS(bus->number) | CFG_DEVICE(PCI_SLOT(devfn)) |
 		CFG_FUNC(PCI_FUNC(devfn));
-	if (bus->parent->number != pp->root_bus_nr)
+	if (!pci_is_root_bus(bus->parent))
 		reg |= CFG_TYPE1;
 	ks_pcie_app_writel(ks_pcie, CFG_SETUP, reg);
 
@@ -457,7 +457,7 @@ static int ks_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 
 	reg = CFG_BUS(bus->number) | CFG_DEVICE(PCI_SLOT(devfn)) |
 		CFG_FUNC(PCI_FUNC(devfn));
-	if (bus->parent->number != pp->root_bus_nr)
+	if (!pci_is_root_bus(bus->parent))
 		reg |= CFG_TYPE1;
 	ks_pcie_app_writel(ks_pcie, CFG_SETUP, reg);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 4a16306cec25..9e8a9cfc6d3a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -473,10 +473,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		goto err_free_msi;
 	}
 
-	pp->root_bus_nr = pp->busn->start;
-
 	bridge->sysdata = pp;
-	bridge->busnr = pp->root_bus_nr;
+	bridge->busnr = pp->busn->start;
 	bridge->ops = &dw_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
@@ -528,7 +526,7 @@ static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 	busdev = PCIE_ATU_BUS(bus->number) | PCIE_ATU_DEV(PCI_SLOT(devfn)) |
 		 PCIE_ATU_FUNC(PCI_FUNC(devfn));
 
-	if (bus->parent->number == pp->root_bus_nr) {
+	if (pci_is_root_bus(bus->parent)) {
 		type = PCIE_ATU_TYPE_CFG0;
 		cpu_addr = pp->cfg0_base;
 		cfg_size = pp->cfg0_size;
@@ -584,13 +582,11 @@ static int dw_pcie_valid_device(struct pcie_port *pp, struct pci_bus *bus,
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	/* If there is no link, then there is no device */
-	if (bus->number != pp->root_bus_nr) {
+	if (!pci_is_root_bus(bus)) {
 		if (!dw_pcie_link_up(pci))
 			return 0;
-	}
-
-	/* Access only one slot on each root port */
-	if (bus->number == pp->root_bus_nr && dev > 0)
+	} else if (dev > 0)
+		/* Access only one slot on each root port */
 		return 0;
 
 	return 1;
@@ -606,7 +602,7 @@ static int dw_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (bus->number == pp->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return dw_pcie_rd_own_conf(pp, where, size, val);
 
 	return dw_pcie_rd_other_conf(pp, bus, devfn, where, size, val);
@@ -620,7 +616,7 @@ static int dw_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	if (!dw_pcie_valid_device(pp, bus, PCI_SLOT(devfn)))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	if (bus->number == pp->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return dw_pcie_wr_own_conf(pp, where, size, val);
 
 	return dw_pcie_wr_other_conf(pp, bus, devfn, where, size, val);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 656e00f8fbeb..fd2146298b58 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -173,7 +173,6 @@ struct dw_pcie_host_ops {
 };
 
 struct pcie_port {
-	u8			root_bus_nr;
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
 	u32			cfg0_size;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
