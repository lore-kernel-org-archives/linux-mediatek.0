Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A20FC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66DB6207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1JAMU19"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66DB6207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UcYl8cgcuiI+w1PP/p0I6JUKSBC5qfO9JkkdDHcRgWY=; b=B1JAMU19KnaRqhrgIKPW8r3I9
	h8Xg/FD+xEDfhJZToCHafhNYVcHKJXxZSoJW8mLmg/JJx3i5UmGGzf5xemdZaNuOufZgruns0n5cr
	xIVD//DjaCnEbfp/+jB+LyxXPVcZn00RayBPA3LvhO+owwmQVJljdN2I/NpBOn8meVk3ifhx7eiJc
	/gnSWQ0uPudLlkO6z3DtD9n0MSY5qV7FMqN8JsvL5QIXQuIe2D7/IySYK1k2cjEIiZVi32UnQKjY9
	8+MrqJtypDwQlOrbBFZ6qlK63Ns2YCdNHxTndVU56nDBrj5KMEmKr+tx9HocaHz+ngBoMArrATHFl
	ufhKkkacA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4VE-0005Xq-Gm; Wed, 22 Jul 2020 02:29:04 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SH-0003tN-VF; Wed, 22 Jul 2020 02:26:06 +0000
Received: by mail-io1-f68.google.com with SMTP id d18so896516ion.0;
 Tue, 21 Jul 2020 19:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ccw7aFBBvUSTsPhiZooV3eXUT4cuUiS9mQQvtImdqBg=;
 b=X36JTvsfxhdH/jaJ/Lm1AtS4sDxqBCdMB6/zzUCFC8A7z+P4zWtzknsag+MQnDb9Ai
 mDvfA4erbAm7+04WcsI2QeqhI2GEjG+UsjFbCyqI1Hnk89sPrlldh5oRGBZSbRvvnfh0
 OWMbkrt131egBEuBC6OY48CPNWhq9ESuDbLx15Cucr8tXqC7RY1OPapbwtpH6w81QYP3
 9GwySOtSZcQkiD7Gb8KM3GoYFUNevxK2iA82+bCfJGaljl+oYRgZ1BRSgHWYF5bbftzs
 FC+ac6tj2ftpHwffTCp4YuYlgUUsNfZjVqorGvmAOp7q/XYrCp1eiW1sHcPZ4K0EeyS/
 uA9w==
X-Gm-Message-State: AOAM533hKztHlkBn1Gi3IbWCoMDllc3onUQl0RVBekcjWNM2dpVJ6vFF
 CGtrq4YQY4XpnJPaCQ/Wgg==
X-Google-Smtp-Source: ABdhPJzG+g+FJ+7V/G0ulxl4gKTGV/ybyBwv8ARgKlZN6HgZPREI6DZWoupZ+Y7XgS/uX9htijqVDA==
X-Received: by 2002:a92:db44:: with SMTP id w4mr29799590ilq.306.1595384761267; 
 Tue, 21 Jul 2020 19:26:01 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:00 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 12/19] PCI: cadence: Use bridge resources for outbound window
 setup
Date: Tue, 21 Jul 2020 20:25:07 -0600
Message-Id: <20200722022514.1283916-13-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222602_205019_F574BE32 
X-CRM114-Status: GOOD (  13.18  )
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

Instead of parsing 'ranges' from DT again, use the bridge window
resources.

Cc: Tom Joseph <tjoseph@cadence.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../controller/cadence/pcie-cadence-host.c    | 37 ++++++++-----------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 84aaf8834e11..f485c0405fb5 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -104,16 +104,14 @@ static int cdns_pcie_host_init_root_port(struct cdns_pcie_rc *rc)
 static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 {
 	struct cdns_pcie *pcie = &rc->pcie;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
 	struct resource *mem_res = pcie->mem_res;
 	struct resource *bus_range = rc->bus_range;
 	struct resource *cfg_res = rc->cfg_res;
-	struct device *dev = pcie->dev;
-	struct device_node *np = dev->of_node;
-	struct of_pci_range_parser parser;
-	struct of_pci_range range;
+	struct resource_entry *entry;
 	u32 addr0, addr1, desc1;
 	u64 cpu_addr;
-	int r, err;
+	int r;
 
 	/*
 	 * Reserve region 0 for PCI configure space accesses:
@@ -132,25 +130,22 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR0(0), addr0);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR1(0), addr1);
 
-	err = of_pci_range_parser_init(&parser, np);
-	if (err)
-		return err;
-
 	r = 1;
-	for_each_of_pci_range(&parser, &range) {
-		bool is_io;
-
-		if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_MEM)
-			is_io = false;
-		else if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_IO)
-			is_io = true;
+	resource_list_for_each_entry(entry, &bridge->windows) {
+		struct resource *res = entry->res;
+		u64 pci_addr = res->start - entry->offset;
+
+		if (resource_type(res) == IORESOURCE_IO)
+			cdns_pcie_set_outbound_region(pcie, 0, r, true,
+						      pci_pio_to_address(res->start),
+						      pci_addr,
+						      resource_size(res));
 		else
-			continue;
+			cdns_pcie_set_outbound_region(pcie, 0, r, false,
+						      res->start,
+						      pci_addr,
+						      resource_size(res));
 
-		cdns_pcie_set_outbound_region(pcie, 0, r, is_io,
-					      range.cpu_addr,
-					      range.pci_addr,
-					      range.size);
 		r++;
 	}
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
