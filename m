Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15E5C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808DF207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KBYdvhe+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808DF207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nDrdjT6YZA8v5W6aQhqqcVWMeY34INtufX/s5U0qXjg=; b=KBYdvhe+wxN6WgYV+YXkqBj8D
	yfBW9aezNAGOTDXzICybOsZvjNHNXNuWych9P5OtjtHgFfdiM+YHGU8F0l9pZUh7wmdh2N0g0EzUi
	1CAZP+a31C8khiqQ6vJEZZ3kjKb7czyUiFSbh3O6PpASmzRSKgvqhpUWuCy6ZC9w12Ykn2XaeEfZw
	z6DSNCkZugwoTgG+T2cK0SpEqPL2xKu/OyX6KYTd4nYCZlPyoVj2eBeJ3L5V5ZRYX+BRki2pHd+TJ
	U5bVv/nn7Cm2NWVcDNt1H8aMii3B15AsP5dzL7IBm8TsXqjgW5XrNvCmEgEJ5Qwl8aDL56VoBiFlt
	DyqJ4k36w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4UX-00052U-76; Wed, 22 Jul 2020 02:28:21 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4S5-0003nA-Op; Wed, 22 Jul 2020 02:25:50 +0000
Received: by mail-io1-f67.google.com with SMTP id i4so842471iov.11;
 Tue, 21 Jul 2020 19:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=np3nvy9/fZz73VqXI9ThmVn27stIXuKqAUSjtJ/i32Y=;
 b=SwJmtAfWsYoRFkS9P7Gw8sUwa74PLoRuOOxSiTBmoCssq4FKN2iSoftIIj2KCHlLGE
 ILMNlSUjRe+lw9edbcQ6E9kW60Sx118/oPa6cvhEegN4HUGXRCHtBBYiyzhwiIbQtkdD
 zc6jg+W3gY9s6eIEFb8MOSxCltNKI/0zhpwenRUDx7Kvce33fTfaT2JsuOEy47hk9MBh
 KCXbt4bcdiUK1VreWAXISZ5BopcDkNTnKm34J9HF7RLdsup9YU5FYtGw06ZebLe8DyI4
 iKTDooaTsIui+hYEk9EIj36RO6FvbfdUfVxb6yy6sxpuZRS7xcFJvI+Vb4kuO1hZH6FL
 RKHQ==
X-Gm-Message-State: AOAM5305ECjcweqd8HAEmIikNGz5a0ua5Ghcy3UEFusapl4yHF4ip5Ta
 Zqq17Gc/bVkRh4DFnZVhyw==
X-Google-Smtp-Source: ABdhPJxOOSSVvaL0MVT3rmsUbxxwRG1d0ASvsh0fZr4SPfQAI5vPpcBrPK1VmklnoR/sUruUvTcbZA==
X-Received: by 2002:a05:6638:22d0:: with SMTP id
 j16mr34632125jat.92.1595384749012; 
 Tue, 21 Jul 2020 19:25:49 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 09/19] PCI: rockchip: Use pci_is_root_bus() to check if bus is
 root bus
Date: Tue, 21 Jul 2020 20:25:04 -0600
Message-Id: <20200722022514.1283916-10-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222549_873023_71B2D165 
X-CRM114-Status: GOOD (  16.83  )
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

Also, bridge->busnr is never set so effectively the root bus must be 0.
This will be fixed by a subsequent commit.

Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-rockchip-host.c | 17 +++++++----------
 drivers/pci/controller/pcie-rockchip.h      |  1 -
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index fb88030161f2..9a30d08976d8 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -72,14 +72,14 @@ static int rockchip_pcie_valid_device(struct rockchip_pcie *rockchip,
 				      struct pci_bus *bus, int dev)
 {
 	/* access only one slot on each root port */
-	if (bus->number == rockchip->root_bus_nr && dev > 0)
+	if (pci_is_root_bus(bus) && dev > 0)
 		return 0;
 
 	/*
 	 * do not read more than one device on the bus directly attached
 	 * to RC's downstream side.
 	 */
-	if (bus->primary == rockchip->root_bus_nr && dev > 0)
+	if (pci_is_root_bus(bus->parent) && dev > 0)
 		return 0;
 
 	return 1;
@@ -170,7 +170,7 @@ static int rockchip_pcie_rd_other_conf(struct rockchip_pcie *rockchip,
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 	}
 
-	if (bus->parent->number == rockchip->root_bus_nr)
+	if (pci_is_root_bus(bus->parent))
 		rockchip_pcie_cfg_configuration_accesses(rockchip,
 						AXI_WRAPPER_TYPE0_CFG);
 	else
@@ -201,7 +201,7 @@ static int rockchip_pcie_wr_other_conf(struct rockchip_pcie *rockchip,
 	if (!IS_ALIGNED(busdev, size))
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
-	if (bus->parent->number == rockchip->root_bus_nr)
+	if (pci_is_root_bus(bus->parent))
 		rockchip_pcie_cfg_configuration_accesses(rockchip,
 						AXI_WRAPPER_TYPE0_CFG);
 	else
@@ -230,7 +230,7 @@ static int rockchip_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (bus->number == rockchip->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return rockchip_pcie_rd_own_conf(rockchip, where, size, val);
 
 	return rockchip_pcie_rd_other_conf(rockchip, bus, devfn, where, size,
@@ -245,7 +245,7 @@ static int rockchip_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	if (!rockchip_pcie_valid_device(rockchip, bus, PCI_SLOT(devfn)))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	if (bus->number == rockchip->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return rockchip_pcie_wr_own_conf(rockchip, where, size, val);
 
 	return rockchip_pcie_wr_other_conf(rockchip, bus, devfn, where, size,
@@ -950,7 +950,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	struct rockchip_pcie *rockchip;
 	struct device *dev = &pdev->dev;
 	struct pci_host_bridge *bridge;
-	struct resource *bus_res;
 	int err;
 
 	if (!dev->of_node)
@@ -991,12 +990,10 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_deinit_port;
 
 	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
-					      &bridge->dma_ranges, &bus_res);
+					      &bridge->dma_ranges, NULL);
 	if (err)
 		goto err_remove_irq_domain;
 
-	rockchip->root_bus_nr = bus_res->start;
-
 	err = rockchip_pcie_cfg_atu(rockchip);
 	if (err)
 		goto err_remove_irq_domain;
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 4012543bafbe..c7d0178fc8c2 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -298,7 +298,6 @@ struct rockchip_pcie {
 	struct	gpio_desc *ep_gpio;
 	u32	lanes;
 	u8      lanes_map;
-	u8	root_bus_nr;
 	int	link_gen;
 	struct	device *dev;
 	struct	irq_domain *irq_domain;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
