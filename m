Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B519CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5470F217D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SWBLaizy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5470F217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDamL/LDmyHdtWF7e9SfhsPhb1uv3Rl0hjhnON12W5s=; b=SWBLaizypKrshm
	nNHHE4Hd5r7BjIAa2Fqz9o7L09WsKZPtgDEFUvRt+4Xa/m5PesLRFFdHhRod/B/eXSQar/rpl7b/m
	S4fhhNe7VdMtya6OhIOk4+7nI+1JxEmCdYjgBKaYUne9us6XEI6rpLek8k63dO82ZQOyATw5QEaAc
	O5yGC5bmRo6kjwwW0vDptGEs6FpuJ4NWDbNpYkftWD5f+HHCihHGhL4OYB/cNFbh42ZXIKvN18Eln
	1XyZ8bOoPAyadWp4BmMqXIqi2W5BeaWg2ZI2YR8wDH+zYjomh8WSnlZn0pZsc1dkclOKwxosz0m8M
	Cg/ixdsJfpBoHhVKiF3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP82k-0004KA-2f; Mon, 28 Oct 2019 16:38:58 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7xR-000735-O1; Mon, 28 Oct 2019 16:33:31 +0000
Received: by mail-ot1-f65.google.com with SMTP id d8so7161115otc.7;
 Mon, 28 Oct 2019 09:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iYotT8vplUpPAxDBkQ4PaMlGqTylW6sNvKndwgHpCIU=;
 b=Jx+dycVNzxhFolKgQfLnGriCsVwyIJMmWqCHUcHQbBUB3Td7lIW7bqtRmoheLJYuPv
 2QBVqpRRxQlCPiAZTRLLH503UHlbwJGLkwwv+6jm7JKX4dNGRBm1172KnHTQjLO/AGTc
 DM8qhoqqBEiSEaMNCcaiV6arbMEZgPdU9rPcUPLgrM3AUUyhWsySy53ZAia1Szht330S
 kvlyEXcGfYhGTYr9w65SIZuC/+z7ahSR6yO3kex84h80QfBe8lVyM78wPxePmd1ycrhz
 KMNL2mXvlBGYPtwpxVYviBa3lCNBG5h/yiD49bUnSUBz89CQwb4tRWyJ+kBV770Rpw7H
 XdJA==
X-Gm-Message-State: APjAAAXyduivGoR6dX9i/Rp8PXNDQ+McyVycq4b7dadg8e9SyzruZfIj
 To3hTU9dn2jQ7/B/kOzc2w==
X-Google-Smtp-Source: APXvYqy+uBASJDG3rPdo2O4wCkiHo4NzLsXE1unvcdols14xzwz4puZsL1iBoWYniAt7v02TGXZGNw==
X-Received: by 2002:a9d:3e53:: with SMTP id h19mr8986935otg.98.1572280408846; 
 Mon, 28 Oct 2019 09:33:28 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 11/25] PCI: rockchip: Drop storing driver private outbound
 resource data
Date: Mon, 28 Oct 2019 11:32:42 -0500
Message-Id: <20191028163256.8004-12-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093329_797719_718F5756 
X-CRM114-Status: GOOD (  14.27  )
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Rockchip host bridge driver doesn't need to store outboard resources
in its private struct as they are already stored in struct
pci_host_bridge.

Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-rockchip-host.c | 54 +++++++++------------
 drivers/pci/controller/pcie-rockchip.h      |  5 --
 2 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 8d2e6f2e141e..f375e55ea02e 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -806,19 +806,28 @@ static int rockchip_pcie_prog_ib_atu(struct rockchip_pcie *rockchip,
 static int rockchip_pcie_cfg_atu(struct rockchip_pcie *rockchip)
 {
 	struct device *dev = rockchip->dev;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rockchip);
+	struct resource_entry *entry;
+	u64 pci_addr, size;
 	int offset;
 	int err;
 	int reg_no;
 
 	rockchip_pcie_cfg_configuration_accesses(rockchip,
 						 AXI_WRAPPER_TYPE0_CFG);
+	entry = resource_list_first_type(&bridge->windows, IORESOURCE_MEM);
+	if (!entry)
+		return -ENODEV;
+
+	size = resource_size(entry->res);
+	pci_addr = entry->res->start - entry->offset;
+	rockchip->msg_bus_addr = pci_addr;
 
-	for (reg_no = 0; reg_no < (rockchip->mem_size >> 20); reg_no++) {
+	for (reg_no = 0; reg_no < (size >> 20); reg_no++) {
 		err = rockchip_pcie_prog_ob_atu(rockchip, reg_no + 1,
 						AXI_WRAPPER_MEM_WRITE,
 						20 - 1,
-						rockchip->mem_bus_addr +
-						(reg_no << 20),
+						pci_addr + (reg_no << 20),
 						0);
 		if (err) {
 			dev_err(dev, "program RC mem outbound ATU failed\n");
@@ -832,14 +841,20 @@ static int rockchip_pcie_cfg_atu(struct rockchip_pcie *rockchip)
 		return err;
 	}
 
-	offset = rockchip->mem_size >> 20;
-	for (reg_no = 0; reg_no < (rockchip->io_size >> 20); reg_no++) {
+	entry = resource_list_first_type(&bridge->windows, IORESOURCE_IO);
+	if (!entry)
+		return -ENODEV;
+
+	size = resource_size(entry->res);
+	pci_addr = entry->res->start - entry->offset;
+
+	offset = size >> 20;
+	for (reg_no = 0; reg_no < (size >> 20); reg_no++) {
 		err = rockchip_pcie_prog_ob_atu(rockchip,
 						reg_no + 1 + offset,
 						AXI_WRAPPER_IO_WRITE,
 						20 - 1,
-						rockchip->io_bus_addr +
-						(reg_no << 20),
+						pci_addr + (reg_no << 20),
 						0);
 		if (err) {
 			dev_err(dev, "program RC io outbound ATU failed\n");
@@ -852,8 +867,7 @@ static int rockchip_pcie_cfg_atu(struct rockchip_pcie *rockchip)
 				  AXI_WRAPPER_NOR_MSG,
 				  20 - 1, 0, 0);
 
-	rockchip->msg_bus_addr = rockchip->mem_bus_addr +
-					((reg_no + offset) << 20);
+	rockchip->msg_bus_addr += ((reg_no + offset) << 20);
 	return err;
 }
 
@@ -951,7 +965,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	struct pci_bus *bus, *child;
 	struct pci_host_bridge *bridge;
 	struct resource *bus_res;
-	struct resource_entry *win;
 	int err;
 
 	if (!dev->of_node)
@@ -997,27 +1010,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 
 	rockchip->root_bus_nr = bus_res->start;
 
-	/* Get the I/O and memory ranges from DT */
-	resource_list_for_each_entry(win, &bridge->windows) {
-		switch (resource_type(win->res)) {
-		case IORESOURCE_IO:
-			io = win->res;
-			io->name = "I/O";
-			rockchip->io_size = resource_size(io);
-			rockchip->io_bus_addr = io->start - win->offset;
-			rockchip->io = io;
-			break;
-		case IORESOURCE_MEM:
-			mem = win->res;
-			mem->name = "MEM";
-			rockchip->mem_size = resource_size(mem);
-			rockchip->mem_bus_addr = mem->start - win->offset;
-			break;
-		default:
-			continue;
-		}
-	}
-
 	err = rockchip_pcie_cfg_atu(rockchip);
 	if (err)
 		goto err_remove_irq_domain;
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 8e87a059ce73..bef42a803b56 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -304,13 +304,8 @@ struct rockchip_pcie {
 	struct	irq_domain *irq_domain;
 	int     offset;
 	struct pci_bus *root_bus;
-	struct resource *io;
-	phys_addr_t io_bus_addr;
-	u32     io_size;
 	void    __iomem *msg_region;
-	u32     mem_size;
 	phys_addr_t msg_bus_addr;
-	phys_addr_t mem_bus_addr;
 	bool is_rc;
 	struct resource *mem_res;
 };
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
